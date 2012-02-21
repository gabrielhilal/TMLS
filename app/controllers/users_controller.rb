class UsersController < ApplicationController
  before_filter :admin, only: [:new, :create, :index ]

  def index
    @title = "Manage Users"
    @users=User.all
  end

  def show
    @title = "Home"
    if current_user.nil?
      redirect_to login_path
    end
  end

  def new
    @title = "New User"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User " + @user.name + " created!"
      redirect_to users_url
    else
      @title = "New User"
      render "new"
    end
  end

  def edit
    @title = "Edit User"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User details updated!"
        if current_user.admin?
          redirect_to users_path
        else
          redirect_to user_path
        end
    else
      @title = "Edit User"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      flash[:error] = "User can't be deleted"
      redirect_to users_path
    else
      @user.destroy
      flash[:success] = "User deleted!"
      redirect_to users_path
    end
  end

end
