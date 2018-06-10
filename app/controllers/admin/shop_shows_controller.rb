class Admin::ShopShowsController < Admin::Base

  def index
    @shop_shows = ShopShow.all.order("examine").page(params[:page])
  end

  def show
    @shop_show = ShopShow.find(params[:id])
    redirect_to edit_admin_shop_show_path(id: shop_show.id)
  end

  def new
    @shop_show = ShopShow.new
  end

  def edit
    @shop_show = ShopShow.find(params[:id])
    @categories = Category.all
    @feature = Feature.find_by(shop_show_id: params[:id])
    @prefectures = Prefecture.all
    @prefecture = @shop_show.prefecture
    @routes = @prefecture.routes.uniq
    @stations = Station.where(route_id: @shop_show.route_id)
  end

  def create
    @shop_show = ShopShow.new(shop_show_params)

    if @shop_show.save
      flash.notice = '求人情報を新規登録しました。'
      redirect_to :admin_shop_shows
    else
      render action: 'new'
    end
  end

  def update
    @shop_show = ShopShow.find(params[:id])

    examin_check = 0
    if @shop_show.examine == false
      examin_check = 100
    end
    if @shop_show.update(shop_show_params)
      flash.notice ='求人情報を更新しました。'

      if @shop_show.examine == true
        if examin_check == 100
          ExamineShowMailWorker.perform_async(@shop_show.shop_info.id, @shop_show.id)
          flash.notice ='求人情報を更新して，メールを送信しました。'

        end
      end
      redirect_to :admin_shop_shows
    else
      render action: 'edit'
    end
  end

  def destroy
    @shop_show = ShopShow.find(params[:id])
    @shop_show.destroy!
    flash.notice = '求人情報を削除しました。'
    redirect_to :admin_shop_shows
  end

  private

  def shop_show_params
    params.require(:shop_show).permit(
      :shop_name, :prefecture_id, :city_id, :house_number,
      :payment_hour_high, :payment_hour_low, :payment_day, :category_id,
      :route_id, :station_id, :title, :summary, :time_morning, :time_noon, :time_afternoon, :time_night,
      :time_midnight, :job_content, :congratulation_money, :message, :line_id,
      :guarantee, :carfare, :experience, :short, :one_day_week, :free_shift, :two_jobs, :note,
      :main_image, :image1, :image2, :image3, :stop_flag, :examine, :shop_point,
      feature_attributes: [:daily, :guarantee, :carfare, :beginner,
                           :experience, :menstruation, :dormitory,
                           :room, :nursery, :pickup, :alibi, :home]
    )
  end


end
