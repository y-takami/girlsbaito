class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class Forbidden < ActionController::ActionControllerError;
  end
  class IpAddressRejected < ActionController::ActionControllerError;
  end

  include ErrorHandlers if Rails.env.production?

  helper_method :current_girl

  layout :set_layout

  private

  def current_girl
    if girl_id = cookies.signed[:girl_id] || session[:girl_id]
      @current_girl ||= Girl.find_by(id: girl_id)
    end
  end

  def set_layout
    if params[:controller].match(%r{\A(shop|admin|girl)/})
      Regexp.last_match[1]
    else
      'girl'
    end
  end

end
