class ExamineInvitationMailWorker
  include Sidekiq::Worker

  def perform(invitation_id)
    @invitation = Invitation.find(invitation_id)
    @mail = NoticeMailer.examine_invitation(@invitation).deliver
  end

end