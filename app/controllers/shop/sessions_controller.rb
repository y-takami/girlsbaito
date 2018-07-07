class Shop::SessionsController < Shop::Base
  skip_before_action :authenticate_girl!

  def new
    if current_shop
      redirect_to :shop_root
    else
      @form = Shop::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Shop::LoginForm.new(params[:shop_login_form])
    if @form.email.present?
      shop = ShopInfo.find_by(admin_email: @form.email.downcase)
    end
    if shop
      if shop.authenticate(@form.password)
        if shop.suspended?
          flash.now.alert = 'アカウントが停止されています。'
          render action: 'new'
        elsif !shop.examine?
          flash.now.alert = '審査が完了していません。'
          render action: 'new'
        else
          session[:shop_id] = shop.id
          flash.notice ='ログインしました。'
          redirect_to :shop_root
        end
      else
        flash.now.alert = 'メールアドレスまたはパスワードが正しくありません'
        render action: 'new'
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:shop_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :shop_root
  end

end
