class InvitationPointMailWorker
  include Sidekiq::Worker

  def perform(invitation_id)
    @invitation = Invitation.find(invitation_id)
    @mail = NoticeMailer.invitation_point(@invitation).deliver
  end

end