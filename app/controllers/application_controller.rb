class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :validate_user, except: [:current_user, :validate_user]
  # Prevent CSRF attacks by raising an exception.
  # Use :null_session with API.
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token, if: :json_request?


  def json_request?
    request.format.json?
  end

  def validate_user
    redirect_to new_user_path unless current_user
  end

end
