class Girl::PasswordsController < Girl::Base

  def show
    redirect_to :edit_girl_password
  end

  def edit
    @change_password_form = Girl::ChangePasswordForm.new(object: current_girl)
  end

  def update
    @change_password_form = Girl::ChangePasswordForm.new(girl_params)
    @change_password_form.object = current_girl
    if @change_password_form.save
      flash.notice = 'パスワードを変更しました。'
      redirect_to :girl_account
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end

  private
  def girl_params
    params.require(:girl_change_password_form).permit(
      :current_password, :new_password, :new_password_confirmation
    )
  end

end