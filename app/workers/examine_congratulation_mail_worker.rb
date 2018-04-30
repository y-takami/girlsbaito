class ExamineCongratulationMailWorker
  include Sidekiq::Worker

  def perform(congratulation_id)
    @congratulation = Congratulation.find(congratulation_id)
    @mail = NoticeMailer.examine_congratulation(@congratulation).deliver
  end

end