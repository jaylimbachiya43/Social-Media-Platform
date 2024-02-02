class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:your_protected_action]
  helper_method :current_user
  def current_user
	if session[:user_id]
  	@current_user ||= User.find(session[:user_id])
	else
	@current_user = nil
	end
  end

  def your_protected_action
    # This action is only accessible to authenticated users
    @message = "Welcome, #{current_user.email}! You have access to this protected action."
  end
end
