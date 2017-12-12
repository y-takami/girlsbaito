class ExamineShopShowMailWorker
  include Sidekiq::Worker

  def perform(shop_show_id)
    @shop_show = Shop_Show.find(shop_show_id)
    @shop = @shop_show.shop_info
    @mail = NoticeMailer.examine_shop_show(@shop).deliver
  end

end