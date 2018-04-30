class ExamineShowMailWorker
  include Sidekiq::Worker

  def perform(shop_id)
    @shop = ShopInfo.find(shop_id)
    @mail = NoticeMailer.examine_show(@shop).deliver
  end

end