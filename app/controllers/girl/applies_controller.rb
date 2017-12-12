class Girl::AppliesController < Girl::Base

  def index
    @girl = current_girl
    @applies = Apply.where(girl_id: @girl.id).page(params[:page])
  end

  def show
    @girl = current_girl
    @apply = Apply.find(params[:id])
  end

  def new
    unless current_girl
      redirect_to :new_girl_session and return
    end
    @shop = ShopShow.find(params[:shop_id])
    @girl = current_girl
    @apply = Apply.new(email: @girl.email, name: @girl.name, tel: @girl.tel, line_id: @girl.line_id)
  end


  def create
    shop_show = ShopShow.find(params[:shop_id])
    girl = current_girl
    apply_vali = Apply.new(apply_params)
    #バリデーション用のダミー，トランザクションの外でバリデーション処理するため
    unless apply_vali.save
      @shop = ShopShow.find(params[:shop_id])
      @girl = current_girl
      @apply = apply_vali
      render action: 'new' and return
    end

    apply_vali.delete

    ActiveRecord::Base.transaction do
      shop_show.lock!
      if shop_show.applies.where(girl_id: current_girl).exists?
        flash.alert = "この店舗にはすでに応募済みです。"
        redirect_to girl_shop_path(params[:shop_id]) and return
      end

      girl.update(girl_apply_params)
      if cookies[:invitation]
        apply_params_merge = apply_params.merge(girl_id: girl.id, shop_show_id: shop_show.id, congratulation_money: shop_show.congratulation_money, invitation_code: cookies[:invitation])
      else
        apply_params_merge = apply_params.merge(girl_id: girl.id, shop_show_id: shop_show.id, congratulation_money: shop_show.congratulation_money)
      end
      shop_show.applies.create!(apply_params_merge)
      flash.notice = "応募が完了しました。お店の方からご連絡を差し上げますので，しばらくお待ち下さい。また，３日以上ご連絡がない場合にはお手数ですが，お店へご連絡をお願い致します。"
      ApplyGirlMailWorker.perform_async(current_girl.id, shop_show.id)
      ApplyShopMailWorker.perform_async(current_girl.id, shop_show.id)

      redirect_to girl_shop_path(params[:shop_id]) and return

    end
  end


  private
  def apply_params
    params.require(:apply).permit(
      :name, :email, :tel, :line_id, :method
    )
  end

  def girl_apply_params
    params.require(:apply).permit(
      :name, :email, :tel, :line_id
    )
  end


end
