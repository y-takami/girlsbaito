class Girl::Base < ApplicationController
  before_action :authorize

  private
  def current_girl
    if girl_id = cookies.signed[:girl_id] || session[:girl_id]
      @current_girl ||= Girl.find_by(id: girl_id)
    end
  end

  helper_method :current_girl

  def authorize
    unless current_girl
      flash.alert = 'ログインしてください。'
      redirect_to :new_girl_session
    end
  end

  helper_method :current_girl
end