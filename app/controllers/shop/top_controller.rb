class Shop::TopController < Shop::Base
  skip_before_action :authorize

  def index

  end

  def fee
    @shop = current_shop
    @shop_show = ShopShow.where(shop_info_id: @shop.id)
    @shop_show.each do |n|
      @applies = Apply.where("employment_day <= ?", Time.now ).where("employment_day >= ?", Time.now.beginning_of_month).where(shop_show_id: n.id).where(employment: true).page(params[:page])
    end
    @fee_sum = 0
    @applies.each do |m|
      @fee_sum = @fee_sum + m.congratulation_money*2
    end
  end

  def fee_last_month
    @shop = current_shop
    @shop_show = ShopShow.where(shop_info_id: @shop.id)
    @shop_show.each do |n|
      @applies = Apply.where("employment_day <= ?", Time.now.prev_month.end_of_month ).where("employment_day <= ?", Time.now.prev_month.beginning_of_month).where(shop_show_id: n.id).where(employment: true).page(params[:page])
    end
    @fee_sum = 0
    @applies.each do |m|
      @fee_sum = @fee_sum + m.congratulation_money*2
    end
    render 'shop/top/fee'
  end

  #募集一時停止用
  def stop_flag_true
    @shop_show = ShopShow.find(params[:shop_id])
    @shop_show.stop_flag_shop = true
    @shop_show.save
    flash.notice = "#{@shop_show.shop_name}の募集を一時停止しました。"
    redirect_to shop_recruit_index_path
  end

  #募集再開用
  def stop_flag_false
    @shop_show = ShopShow.find(params[:shop_id])
    @shop_show.stop_flag_shop = false
    @shop_show.save
    flash.notice = "#{@shop_show.shop_name}の募集を再開しました。"
    redirect_to shop_recruit_index_path
  end

  def contact
  end

  def policy
  end

  def personal_info
  end

end
