class RegisterShopMailWorker
  include Sidekiq::Worker

  def perform(shop_id)
    @shop = ShopInfo.find(shop_id)
    @mail = NoticeMailer.register_shop(@shop).deliver
  end

end