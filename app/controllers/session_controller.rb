class SessionController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  def new

  end

  #in the method we will create a session variable with user ID
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "now have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There was Something wrong with your login information"
      render 'new'
    end
  end

  #with the help of these method we can destroy session value
  def destroy
    session[:user_id] = nil
    flash[:success] = "now have successfully logged out"
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "you are alredy logged in"
      redirect_to root_path
    end
  end
end
