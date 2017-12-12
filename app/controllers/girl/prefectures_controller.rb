class Girl::PrefecturesController < Girl::Base
  skip_before_action :authorize

  def index
    if cookies[:prefecture]
      redirect_to "/prefectures/#{cookies[:prefecture]}"
    else
      cookies.delete :prefecture
      @prefectures = Prefecture.all.includes(:shop_shows)
      @shops_count = ShopShow.all.where(examine: true).count

    end
  end

  def show
    cookies[:prefecture] = params[:id]
    @prefecture = Prefecture.find(params[:id])
    @shops_count = ShopShow.where(prefecture_id: params[:id]).where(examine: true).count
    @search_form = Girl::ShopSearchForm.new(params[:search])
    @new_shops = ShopShow.where(prefecture_id: params[:id]).where(examine: true).order(created_at: :desc).limit(3) #新着ショップの取得
    #気になるショップリストの取得
    if cookies[:favorite]
      favorite = cookies[:favorite].split(" ")
      favorite = favorite.reverse.take(3)
      @favorite_shops = ShopShow.find(favorite)
    end
    #履歴ショップリストの取得
    if cookies[:history]
      history = cookies[:history].split(" ")
      history = history.reverse.take(3)
      @history_shops = ShopShow.find(history)
    end

    #    @shops = @search_form.search.page(params[:page])
    render 'girl/top/index'
  end

  def new
    cookies.delete :prefecture
    redirect_to girl_root_path
  end

end
