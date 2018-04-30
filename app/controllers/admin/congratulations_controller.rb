class Admin::CongratulationsController < Admin::Base

  def edit
    @apply = Apply.find(params[:id])
    @congratulation = Congratulation.find_by(apply_id: params[:id])
  end

  def update
    @congratulation = Congratulation.find_by(apply_id: params[:id])
    ActiveRecord::Base.transaction do
      if @congratulation.update(congratulation_params)
        if @congratulation.apply.invitation_code
          @girl = Girl.find_by(invitation_code: @congratulation.apply.invitation_code)
          @point = Point.new(girl_id: @girl.id, amount: 5000) #この数字で招待ポイントを決める
          @point.save
          invitation_point = @girl.invitation_point
          invitation_point = invitation_point+@point.amount
          if @girl.update(invitation_point: invitation_point)
            flash.notice ='お祝い金審査を完了し，メールを送信しました。招待ポイントを招待者に付与しました。'
            ExamineCongratulationMailWorker.perform_async(@congratulation.id)
          else
            render action: 'edit' and return
          end
          flash.notice ='お祝い金審査を完了し，メールを送信しました' unless @girl
          ExamineCongratulationMailWorker.perform_async(@congratulation.id)
        end
        redirect_to :admin_applies
      else
        render action: 'edit'
      end
    end
  end


  private

  def congratulation_params
    params.require(:congratulation).permit(
      :examine
    )
  end

end
