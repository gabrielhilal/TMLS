class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user

protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_path
  end
end
end
