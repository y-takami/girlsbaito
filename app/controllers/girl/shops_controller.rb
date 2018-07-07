class Girl::ShopsController < Girl::Base
  skip_before_action :authenticate_girl!

  def index
    @search_form = Girl::ShopSearchForm.new(params[:search])
    @shops = @search_form.search
    @shops = @search_form.search.page(params[:page])
    #二回繰り返すとなぜか特徴検索がうまくいく。謎・・・
    @shops_count = @search_form.search.count

  end

  def shop_pref
    @prefecture = Prefecture.find(params[:prefecture_id])
    @search_form = Girl::ShopSearchForm.new(params[:search])
    @shops = ShopShow.where(prefecture_id: params[:prefecture_id]).where(examine: true).order("shop_point").page(params[:page])
    @shops_count = ShopShow.where(prefecture_id: params[:prefecture_id]).count
    render :template => "girl/shops/index"
  end


  def show
    @shop = ShopShow.find(params[:id])
    @apply_button = true


    if @shop.stop_flag == true
      flash.now[:notice] = "申し訳ございません。この店舗の募集は停止しております。現在応募はできません。"
      @apply_button = false
    end

    if @shop.examine == false
      flash.now[:notice] = "申し訳ございません。この店舗の情報は編集中です。現在応募はできません。終了までしばらくお待ち下さい。"
      @apply_button = false
    end

    if @shop.stop_flag_shop == true
      flash.now[:notice] = "申し訳ございません。この店舗の募集は現在停止しております。募集再開までしばらくお待ち下さい。"
      @apply_button = false
    end

    if cookies[:history]
      cookies.permanent[:history] += " #{params[:id]}"
      cookies.permanent[:history] = cookies.permanent[:history].split(" ").uniq
      cookies.permanent[:history] = cookies.permanent[:history].join(" ")

      if current_girl
        history = cookies[:history]
        if current_girl.history != nil
          history = current_girl.history + " " + history
        end
        history = history.split(" ").uniq
        history = history.join(" ")
        current_girl.history = history
        current_girl.save
      end

    else
      cookies.permanent[:history] = " #{params[:id]}"
      if current_girl
        current_girl.history = " #{params[:id]}"
        current_girl.save
      end
    end
    unless current_girl
      session[:return_to] = request.url
      session[:url_last_access_time] = Time.current
    end


  end

  def search_ajax
    @search_form = Girl::ShopSearchForm(params[:search])
    @shops_count = @search_form.search.count
  end

end
