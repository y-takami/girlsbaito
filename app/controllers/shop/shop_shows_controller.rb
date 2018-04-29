class Shop::ShopShowsController < Shop::Base

  def index
    @shop = current_shop
    @shop_shows = ShopShow.where(shop_info_id: @shop.id)
  end

  def show
    @shop_show = ShopShow.find_by(id: params[:id])
  end

  def new

    if ShopShow.all.where(shop_info_id: current_shop.id).count >= current_shop.group_number
      flash.notice = 'これ以上は求人情報を作成できません。作成する場合には登録情報管理からグループ店舗数の変更を行って下さい。'
      redirect_to :shop_recruit_index
    end

    @shop_show = ShopShow.new
    @shop_show.build_feature
    @categories = Category.all
    @prefectures = Prefecture.all
    @prefecture = Prefecture.find_by(id: 13)
    @routes = @prefecture.routes.uniq
    @stations = Station.where(prefecture_id: 13)
  end

  def create

    @shop_show = ShopShow.new(shop_params)
    @shop_show.shop_info_id = current_shop.id
    @categories = Category.all
    @prefectures = Prefecture.all
    @prefecture = @shop_show.prefecture
    @routes = @prefecture.routes.uniq
    @stations = Station.where(prefecture_id: @prefecture.id)

    if @shop_show.save
      flash.notice = '求人情報を新規登録しました。掲載のための審査を行います。審査は最長で３日程度かかる場合があります。'
      redirect_to :shop_recruit_index
    else
      render action: 'new'
    end
  end

  def edit
    @shop_show = ShopShow.find_by(id: params[:id])
    @categories = Category.all
    @feature = Feature.find_by(shop_show_id: params[:id])
    @prefectures = Prefecture.all
    @prefecture = @shop_show.prefecture
    @routes = @prefecture.routes.uniq
    @stations = Station.where(route_id: @shop_show.route_id)
  end

  def update
    @shop_show = ShopShow.find_by(id: params[:id])
    @feature = Feature.find_by(shop_show_id: params[:id])
    @shop_show.examine = false
    if @shop_show.update(shop_params)
      flash.notice ='店舗情報を更新しました。掲載のための審査を行います。審査は最長で３日程度かかる場合があります。'
      redirect_to shop_recruit_path(params[:id]) and return
    else
      @prefectures = Prefecture.all
      @prefecture = @shop_show.prefecture
      @categories = Category.all
      @routes = @prefecture.routes.uniq
      @stations = Station.where(route_id: @shop_show.route_id)


      render action: 'edit' and return
    end
  end

  def cities_select

    #    @shop_show = ShopShow.new
    #    @shop_show.build_feature
    #    @categories = Category.all
    #    @prefectures = Prefecture.all
    @prefecture = Prefecture.find_by(id: params[:prefecture_id])
    #    @routes = @prefecture.routes.uniq
    #   @stations = Station.where(prefecture_id: params[:prefecture_id])
    render partial: 'cities'
  end

  def routes_select
    @prefecture = Prefecture.find_by(id: params[:prefecture_id])
    @routes = @prefecture.routes.uniq
    render partial: 'routes'
  end

  def stations_select
    @stations = Station.where(route_id: params[:route_id])
    render partial: 'stations'
  end


  private

  def shop_params
    params.require(:shop_show).permit(
      :shop_name, :url, :prefecture_id, :city_id, :house_number,
      :payment_hour_high, :payment_hour_low, :payment_day, :category_id,
      :route_id, :station_id, :title, :summary, :time_morning, :time_noon, :time_afternoon, :time_night,
      :time_midnight, :job_content, :congratulation_money, :message, :line_id,
      :guarantee, :carfare, :experience, :short, :one_day_week, :free_shift, :two_jobs, :note,
      :main_image, :image1, :image2, :image3,
      feature_attributes: [:daily, :guarantee, :carfare, :beginner,
                           :experience, :menstruation, :dormitory,
                           :room, :nursery, :pickup, :alibi, :home]
    )
  end


end


