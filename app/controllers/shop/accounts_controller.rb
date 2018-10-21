class Shop::AccountsController < Shop::Base
  skip_before_action :authorize, only: [ :new, :create ]

  def new
    @shop = ShopInfo.new
  end

  def create
    @shop = ShopInfo.new(shop_params)

    if @shop.save
      flash.notice ='登録申請が完了しました。審査が完了しましたら，メールにてご連絡いたしますのでしばらくお待ち下さい。審査には通常１日〜１週間程度かかります。'
      RegisterShopMailWorker.perform_async(@shop.id)
      redirect_to :shop_root

    else
      render action: 'new'
    end

  end

  def show
    @shop = current_shop
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.examine = false
    if @shop.update(shop_params)
      flash.notice ='登録情報を更新しました。更新の内容確認を行います。確認完了までログインができなくなりますので，ご注意下さい。確認が完了しましたら，メールにてご連絡いたしますのでしばらくお待ち下さい。
審査は通常１日以内に完了いたしますが，グループ店舗数を増加させた場合には，その店舗分の確認書が必要となります。その場合，確認には通常１日〜１週間程度かかります。'
      RegisterShopMailWorker.perform_async(@shop.id)
      redirect_to :shop_account
    else
      render action: 'edit'
    end
  end

  private
  def shop_params
    params.require(:shop_info).permit(
      :group_number, :shop_name, :url, :admin_name, :admin_name_sei, :admin_name_mei, :admin_email,
      :admin_tel,  :manager_name, :manager_name_sei, :manager_name_mei, :manager_email, :manager_tel,
      :postal_first, :postal_last, :prefecture, :city, :house_number,
      :password
    )
  end

end
