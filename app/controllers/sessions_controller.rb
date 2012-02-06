class SessionsController < ApplicationController
  skip_before_filter :authorize

  def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:success] = "Logged in"
    redirect_to user
  else
    flash.now[:error] = "Invalid email/password combination."
    render "new"
  end
end

def new
end

def destroy
  session[:user_id] = nil
  flash[:success] = "Logged out"
  redirect_to login_path
end
end
