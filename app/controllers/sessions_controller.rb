class SessionsController < ApplicationController
  skip_before_filter :authorize

  def create
  user = User.find_by_name(params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:success] = "Welcome " + current_user.name
    redirect_to user
  else
    flash.now[:error] = "Invalid username/password combination."
    render "new"
  end
end

  def new
    unless current_user.nil?
      redirect_to current_user
    end
  end

def destroy
  session[:user_id] = nil
  flash[:success] = "Logged out"
  redirect_to login_path
end
end
