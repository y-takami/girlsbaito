class Admin::Base < ApplicationController
  before_action :authorize
  before_action :check_timeout

  private
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end

  helper_method :current_admin

  def authorize
    unless current_admin
      flash.alert = '管理者としてログインしてください。'
      redirect_to :new_admin_session
    end
  end


  TIMEOUT = 2000.minutes
  #タイムアウトまでの時間を設定

  def check_timeout
    if current_admin
      if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:admin_id)
        flash.alert = 'セッションタイムアウト'
        redirect_to :new_admin_session
      end
    end
  end



end