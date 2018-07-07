class Girl::CitiesController < Girl::Base
  skip_before_action :authenticate_girl!

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @cities = City.where(prefecture_id: params[:prefecture_id]).order(:id)
    @shop_shows = ShopShow.where(prefecture: params[:prefecture_id]).includes(:cities)

  end

  def show
    @prefecture = Prefecture.find(params[:prefecture_id])
    @city = City.find(params[:id])
    @shops = ShopShow.where(["prefecture_id = ? and city_id = ?", params[:prefecture_id], params[:id]]).where(examine: true).order("shop_point").page(params[:page])
    @shops_count = @shops.count
    @search_form = Girl::ShopSearchForm.new(city: [@city.name])
    render :template => "girl/shops/index" and return
  end

end
