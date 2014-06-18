class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && User.authenticate(params[:user][:email], params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    elsif @user && !User.authenticate(params[:user][:email], params[:user][:password])
      flash[:login_error] = "Incorrect email & password.  Please try again."
      redirect_to new_user_path
    else
      flash[:login_error] = "Email not found.  Please try again."
      redirect_to new_user_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:login_error] = "That email is already taken or you didn't enter a valid email/password combination. Please try again."
      redirect_to new_user_path
    end
  end

  def destroy
    User.destroy(params[:id])
    session.clear
  end

  def logout
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
