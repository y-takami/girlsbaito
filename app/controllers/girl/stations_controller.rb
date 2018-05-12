class Girl::StationsController < Girl::Base
  skip_before_action :authorize

  def show
    @prefecture = Prefecture.find(params[:prefecture_id])
    @station = Station.find(params[:id])
    @route = Route.find(params[:route_id])
    @shops = ShopShow.where(["station_id = ?", params[:id]]).where(examine: true).order("shop_point").page(params[:page])
    @shops_count = @shops.count
    @search_form = Girl::ShopSearchForm.new
    render :template => "girl/shops/index" and return
  end


end
