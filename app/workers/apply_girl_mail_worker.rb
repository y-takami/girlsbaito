class ApplyGirlMailWorker
  include Sidekiq::Worker

  def perform(girl_id, shop_id)
    @girl = Girl.find(girl_id)
    @shop = ShopShow.find(shop_id)
    @mail = NoticeMailer.apply_girl(@girl, @shop).deliver
  end

end