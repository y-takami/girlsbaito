class Girl::RoutesController < Girl::Base
  skip_before_action :authenticate_girl!

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @stations = Station.where(prefecture_id: params[:prefecture_id])
    routes_array = Array.new
    @stations.each do |f|
      routes_array << f.route.id
    end
    routes_array = routes_array.uniq
    @routes = Route.where(id: routes_array)
    @shop_shows = ShopShow.where(prefecture: params[:prefecture_id])

  end

  def show
    @route = Route.find(params[:id])
    @stations = Station.where(route_id: params[:id])
    @prefecture = Prefecture.find(params[:prefecture_id])
    @shop_shows = ShopShow.where(prefecture: params[:prefecture_id])
  end

end
