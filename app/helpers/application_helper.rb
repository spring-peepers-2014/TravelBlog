# Why am I executable?  Do you know what permissions mean?  Or did
# you do random stuff?
module ApplicationHelper

  def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
