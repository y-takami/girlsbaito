class InvitationPointMailWorker
  include Sidekiq::Worker

  def perform(invitation_id, girl_id)
    @invitation = Invitation.find(invitation_id)
    @girl = Girl.find(girl_id)
    @mail = NoticeMailer.invitation_point(@invitation, @girl).deliver
  end

end