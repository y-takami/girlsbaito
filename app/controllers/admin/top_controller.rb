class Admin::TopController < Admin::Base
  skip_before_action :authenticate_girl!

  def index
    if admin_signed_in?
      render action: 'dashboard'
    else
      render action: 'index'
    end
  end

  def fee
    @shops = ShopInfo.all.page(params[:page])
  end

  def fee_last_month
    @shops = ShopInfo.all.page(params[:page])
    render 'admin/top/fee'
  end

  def fee_shop
    @shop = ShopInfo.find(params[:id])
    @shop_shows = ShopShow.where(shop_info_id: @shop.id)
    @shop_shows.each do |n|
      @applies = Apply.where(shop_show_id: n.id).where(employment: true).order("employment_day").page(params[:page])
    end
  end

  private

  helper_method :count_fee, :count_fee_last_month

  def count_fee(shop_id)
    @shop_show = ShopShow.where(shop_info_id: shop_id)
    @shop_show.each do |n|
      @applies = Apply.where("employment_day <= ?", Time.now).where("employment_day >= ?", Time.now.beginning_of_month).where(shop_show_id: n.id).where(employment: true).page(params[:page])
    end
    @fee_sum = 0
    @applies.each do |m|
      @fee_sum = @fee_sum + m.congratulation_money*2
    end
    return @fee_sum
  end

  def count_fee_last_month(shop_id)
    @shop_show = ShopShow.where(shop_info_id: shop_id)
    @shop_show.each do |n|
      @applies = Apply.where("employment_day <= ?", Time.now.prev_month.end_of_month).where("employment_day <= ?", Time.now.prev_month.beginning_of_month).where(shop_show_id: n.id).where(employment: true).page(params[:page])
    end
    @fee_sum = 0
    @applies.each do |m|
      @fee_sum = @fee_sum + m.congratulation_money*2
    end
    return @fee_sum
  end

end
