class ExamineInvitationMailWorker
  include Sidekiq::Worker

  def perform(invitation_id, girl_id)
    @invitation = Invitation.find(invitation_id)
    @girl = Girl.find(girl_id)
    @mail = NoticeMailer.examine_invitation(@invitation, @girl).deliver
  end

end