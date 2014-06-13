module ApplicationHelper
  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    if logged_in?
      @user ||= User.find(session[:user_id])
    end
  end
end
