class ExamineInvitationMailWorker
  include Sidekiq::Worker

  def perform(invitation_id)
    @invitation = Invitation.find(invitation_id)
    @mail = NoticeMailer.examine_congratulation(@invitation).deliver
  end

end