class Admin::ShopsController < Admin::Base

  def index
    @shop = ShopInfo.all.order("examine").page(params[:page])
  end

  def show
    shop = ShopInfo.find(params[:id])
    redirect_to edit_admin_shop_path(id: shop.id)
  end

  def new
    @shop = ShopInfo.new
  end

  def edit
    @shop = ShopInfo.find(params[:id])
  end

  def create
    @shop = ShopInfo.new(shop_params)

    if @shop.save
      flash.notice = '職員アカウントを新規登録しました。'
      redirect_to :admin_shops
    else
      render action: 'new'
    end
  end

  def update
    @shop = ShopInfo.find(params[:id])
    examin_check = 0
    if @shop.examine == false
      examin_check = 100
    end
    if @shop.update(shop_params)
      flash.notice ='店舗情報を更新しました。審査完了の場合にはメールを送信しました。'
      if @shop.examine == true
        if examin_check == 100
          ExamineShopMailWorker.perform_async(@shop.id)
        end
      end
      redirect_to :admin_shops
    else
      render action: 'edit'
    end
  end

  def destroy
    shop = ShopInfo.find(params[:id])
    shop.destroy!
    flash.notice = '職員アカウントを削除しました。'
    redirect_to :admin_shops
  end

  private

  def shop_params
    params.require(:shop_info).permit(
      :group_number, :shop_name, :url, :admin_name, :admin_name_sei, :admin_name_mei, :admin_email,
      :admin_tel, :manager_name, :manager_name_sei, :manager_name_mei,
      :manager_tel, :postal_first, :postal_last, :prefecture, :city, :house_number,
      :password, :suspended, :examine
    )
  end


end
