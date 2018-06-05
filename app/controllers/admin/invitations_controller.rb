class Admin::InvitationsController < Admin::Base

  def index
    @invitations = Invitation.all.page(params[:page])
  end

  def edit
    @invitation = Invitation.find(params[:id])
    @girl = @invitation.girl
  end

  def update
    @invitation = Invitation.find(params[:id])
    @girl = @invitation.girl

    ActiveRecord::Base.transaction do
      if @invitation.update(invitation_params)
        flash.notice ="換金審査を完了してメールを送信しました。#{@invitation.girl.invitation_point}#{@invitation.application_amount}#{@invitation.girl.name}"
        ExamineInvitationMailWorker.perform_async(@invitation.id)
        redirect_to :admin_invitations
      else
        render action: 'edit'
      end
    end
  end


  private

  def invitation_params
    params.require(:invitation).permit(
      :examine
    )
  end

end

