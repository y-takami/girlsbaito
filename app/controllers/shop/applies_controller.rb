class Shop::AppliesController < Shop::Base

  def index
    @shop = current_shop
    @shop_show = ShopShow.where(shop_info_id: @shop.id)
    @shop_show.each do |n|
      @applies = Apply.where(shop_show_id: n.id).page(params[:page])
    end
  end

  def show
    @apply = Apply.find(params[:id])
  end

  def edit
    @apply = Apply.find(params[:id])
    unless (@apply.employment==nil) && (@apply.interview==nil)
      render 'show' and return
    end
  end

  def update
    @apply = Apply.find(params[:id])
    @apply.assign_attributes(apply_params)
    @apply.employment_day = Time.now
    if @apply.save
      flash.notice ='採用可否を入力しました。'
      redirect_to :shop_apply
    else
      render action: 'edit'
    end
  end

  private
  def apply_params
    params.require(:apply).permit(
      :employment, :interview, :first_work_day
    )
  end
end
