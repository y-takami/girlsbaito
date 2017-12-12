class Girl::SessionsController < Girl::Base
  skip_before_action :authorize

  def new
    if current_girl
      redirect_to :girl_root
    else
      @form = Girl::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Girl::LoginForm.new(params[:girl_login_form])
    if @form.email.present?
      girl = Girl.find_by(email: @form.email.downcase)
    end
    if girl
      if girl.authenticate(@form.password)
        cookies.permanent.signed[:girl_id] = girl.id
        session[:girl_id] = girl.id
        flash.notice ='ログインしました。'
        favorite_mix
        history_mix
        if session[:url_last_access_time]
          if session[:return_to] && (session[:url_last_access_time] >= 3.minutes.ago)
            redirect_to session[:return_to] and return
          end
        end
        redirect_to :girl_root
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
    cookies.delete(:girl_id)
    session.delete(:girl_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :girl_root
  end


  private

  #気になるリストのクッキーとデータベースの重複消去とマージ用
  #top#favorite_addにも存在
  def favorite_mix
    if cookies[:favorite]
      cookies.permanent[:favorite] += " #{params[:shop_id]}"
      cookies.permanent[:favorite] = cookies.permanent[:favorite].split(" ").uniq
      cookies.permanent[:favorite] = cookies.permanent[:favorite].join(" ")
      if current_girl
        favorite = cookies[:favorite]
        if current_girl.favorite != nil
          favorite = current_girl.favorite + " " + favorite
        end
        favorite = favorite.split(" ").uniq
        favorite = favorite.join(" ")
        current_girl.favorite = favorite
        current_girl.save
      end
    end
  end

  #最近見たリストのクッキーとデータベースの重複消去とマージ用
  #girl/shop#showにも存在
  def history_mix
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
    end
  end


end
