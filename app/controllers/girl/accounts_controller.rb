class Girl::AccountsController < Girl::Base
  skip_before_action :authenticate_girl!

  def show
    @girl = current_girl
  end

  def new
    @girl = Girl.new
  end

  def create

    @girl = Girl.new(girl_params)
    @girl.invitation_code = rand(100000...999999)

    if @girl.save

      flash.notice ='新規アカウントを作成し，ログインしました。'

      redirect_to :girl_root

    else
      render action: 'new'
    end

  end

  def edit
    @girl = current_girl
  end

  def update
    @girl = current_girl
    if @girl.update(girl_params)
      flash.notice ='登録情報を更新しました。'
      redirect_to :girl_account
    else
      render action: 'edit'
    end
  end

  private
  def girl_params
    params.require(:girl).permit(
      :email, :password, :password_confirmation, :invitation_code, :nickname, :name, :tel, :line_id
    )
  end

  def girl_login_params
    params.require(:girl).permit(
      :email, :password
    )
  end

end
