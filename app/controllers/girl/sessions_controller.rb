class Girl::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

# GET /resource/sign_in
# def new
#   super
# end

# POST /resource/sign_in
  def create
    super
    if current_girl
      favorite_mix
      history_mix
    end
  end

# DELETE /resource/sign_out
  def destroy
    super
    cookies.delete(:girl_id)
    session.delete(:girl_id)
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


# protected

# If you have extra params to permit, append them to the sanitizer.
# def configure_sign_in_params
#   devise_parameter_sanitizer.for(:sign_in) << :attribute
# end
end
