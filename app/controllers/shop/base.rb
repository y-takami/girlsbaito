class Shop::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  before_action :check_examine
  before_action :apply_time_over

  private
  def apply_time_over
    @apply_time_overs = Apply.where("created_at <= ?", Time.now - 60.days).where(employment: nil)
    if @apply_time_overs
      @apply_time_overs.each do |f|
        f.update({"employment" => true, "time_over" => true, "interview" => f.updated_at + 60.days})
      end
    end
  end

  def current_shop
    if session[:shop_id]
      @current_shop_info ||= ShopInfo.find_by(id: session[:shop_id])
    end
  end

  helper_method :current_shop

  def authorize
    unless current_shop
      flash.alert = 'ログインしてください。'
      redirect_to :new_shop_session
    end
  end

  def check_account
    if current_shop && current_shop.suspended?
      session.delete(:shop_id)
      flash.alert = 'アカウントが無効です。'
      redirect_to :shop_root
    end
  end

  def check_examine
    if current_shop && current_shop.examine==false
      session.delete(:shop_id)
      flash.alert = '登録情報審査中です。'
      redirect_to :shop_root
    end
  end

end