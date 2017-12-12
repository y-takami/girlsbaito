class Girl::CategoriesController < Girl::Base
  skip_before_action :authorize

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @categories = Category.all
    @shop_shows = ShopShow.where(prefecture: params[:prefecture_id])

  end

  def show
    @prefecture = Prefecture.find(params[:prefecture_id])
    @category = Category.find(params[:id])
    @shops = ShopShow.where(["prefecture_id = ? and category_id = ?", params[:prefecture_id], params[:id]]).where(examine: true).order("shop_point").page(params[:page])
    @shops_count = @shops.count
    @search_form = Girl::ShopSearchForm.new(category: [@category.name])
    render :template => "girl/shops/index" and return
  end

end
