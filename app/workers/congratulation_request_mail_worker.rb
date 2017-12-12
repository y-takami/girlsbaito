class CongratulationRequestMailWorker
  include Sidekiq::Worker

  def perform(apply_id)
    @apply = Apply.find(apply_id)
    @mail = NoticeMailer.congratulation_request(@apply).deliver
  end

end