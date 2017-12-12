class Admin::SessionsController < Admin::Base
  skip_before_action :authorize

  def new
    if current_admin
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      admin = Admin.find_by(email: @form.email.downcase)
    end
    if admin
      if admin.authenticate(@form.password)
        session[:admin_id] = admin.id
        session[:last_access_time] = Time.current
        flash.notice ='ログインしました。'
        ShopPointWorker.perform_async #ショップポイントの更新ワーカー
        redirect_to :admin_root
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
    session.delete(:admin_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :admin_root
  end

end
