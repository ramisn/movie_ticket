class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  hide_action :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_login
    redirect_to login_url, alert: "You must first log in or sign up." if current_user.nil?
  end

end





