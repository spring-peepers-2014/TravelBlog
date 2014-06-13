class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def login
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    elsif @user && !@user.authenticate(params[:user][:password])
      flash[:login_error] = "Incorrect username & password.  Please try again."
      redirect_to new_user_path
    else
      flash[:login_error] = "Username not found.  Please try again."
      redirect_to new_user_path
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:login_error] = "That username is already taken or you didn't have a username/password. Please try again."
      redirect_to new_user_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
