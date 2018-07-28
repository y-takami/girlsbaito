class Girl::PrefecturesController < Girl::Base
  skip_before_action :authenticate_girl!
  after_action :modal_check, only: :index

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
    #おすすめショップリストの取得
    @recommend_shops = ShopShow.where(prefecture_id: params[:id]).where(examine: true).order(shop_point: :desc).limit(3)

    #気になるショップリストの取得
    if cookies[:favorite]
      favorite = cookies[:favorite].split(" ")
      favorite = favorite.reverse.take(4)
      @favorite_shops = ShopShow.find(favorite)
    end
    #履歴ショップリストの取得
    if cookies[:history]
      history = cookies[:history].split(" ")
      history = history.reverse.take(4)
      @history_shops = ShopShow.find(history)
    end


    #    @shops = @search_form.search.page(params[:page])
    render 'girl/top/index'
  end

  def new
    cookies.delete :prefecture
    redirect_to girl_root_path
  end

  def go_google
    cookies.delete :modal
    redirect_to "https://www.google.co.jp/"
  end


  private
  def modal_check
    cookies[:modal] = {value: 1, expires: 60.day.from_now}
  end

end
