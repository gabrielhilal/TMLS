class PagesController < ApplicationController
  def index
  if current_user.nil?
    redirect_to login_path
  else
  end
  end

end
