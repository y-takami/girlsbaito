class ExamineShowMailWorker
  include Sidekiq::Worker

  def perform(shop_id, shop_show_id)
    @shop = ShopInfo.find(shop_id)
    @shop_show = ShopShow.find(shop_show_id)
    @mail = NoticeMailer.examine_show(@shop, @shop_show).deliver
  end

end