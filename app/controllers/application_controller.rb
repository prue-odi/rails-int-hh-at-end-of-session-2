class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :authorize

  private

  def authorize
    redirect_to new_session_path if current_user.nil?
  end

  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
