class Girl::InvitationsController < Girl::Base


  def new
    @girl = current_girl
    girl_hash = current_girl.attributes
    girl_hash.delete("nickname"); girl_hash.delete("line_id"); girl_hash.delete("password_digest")
    girl_hash.delete("invitation_code"); girl_hash.delete("invitation_num"); girl_hash.delete("invitation_point")
    girl_hash.delete("favorite"); girl_hash.delete("history")
    @invitation = Invitation.new(girl_hash)
  end

  def create

    @invitation = Invitation.new(invitation_params)
    @girl = current_girl
    girl_invitation_params = invitation_params
    girl_invitation_params.delete("application_amount")
    girl_invitation_params.delete("girl_id")

    ActiveRecord::Base.transaction do
      amount_sum = 0
      if @girl.invitations
        @girl.invitations.each do |f|
          amount_sum = amount_sum + f.application_amount
        end
      end
      point_sum = 0
      if @girl.points
        @girl.points.each do |f|
          point_sum = point_sum + f.amount
        end
      end

      unless (point_sum-amount_sum==@girl.invitation_point)
        raise Exception
      end

      if @invitation.application_amount<0
        raise Exeption
      end

      if @invitation.save && @girl.update(girl_invitation_params)
        if @girl.update(invitation_point: @girl.invitation_point-@invitation.application_amount)
          flash.notice ="#{@invitation.application_amount}ポイントの換金申請が完了しました。審査が完了しましたら，メールにてお知らせ申し上げます。"
          InvitationPointMailWorker.perform_async(@invitation.id, @girl.id)
          redirect_to :girl_account
        else
          render action: 'new'
        end
      else
        render action: 'new'
      end
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(
      :girl_id, :method, :postal_first, :postal_last, :prefecture,
      :city, :house_number, :name, :name_sei_kana, :name_mei_kana, :bank_name,
      :bank_branch_name, :bank_type, :bank_number, :email, :tel, :application_amount
    )
  end


end
