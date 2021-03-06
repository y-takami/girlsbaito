class ExamineShopMailWorker
  include Sidekiq::Worker

  def perform(shop_id)
    @shop = ShopInfo.find(shop_id)
    @mail = NoticeMailer.examine_shop(@shop).deliver
  end

end