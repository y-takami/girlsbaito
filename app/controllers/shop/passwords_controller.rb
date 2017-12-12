class Shop::PasswordsController < Shop::Base

  def show
    redirect_to :edit_shop_password
  end

  def edit
    @change_password_form = Shop::ChangePasswordForm.new(object: current_shop)
  end

  def update
    @change_password_form = Shop::ChangePasswordForm.new(shop_params)
    @change_password_form.object = current_shop
    if @change_password_form.save
      flash.notice = 'パスワードを変更しました。'
      redirect_to :shop_account
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end

  private
  def shop_params
    params.require(:shop_change_password_form).permit(
      :current_password, :new_password, :new_password_confirmation
    )
  end

end
