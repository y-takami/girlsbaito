class RegisterMailWorker
  include Sidekiq::Worker

  def perform(girl_id)
    @girl = Girl.find(girl_id)
    @mail = NoticeMailer.register(@girl).deliver
  end

end