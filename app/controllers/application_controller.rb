class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  helper_method :current_admin

  protected
  def current_admin
    current_user.try(:admin?) && current_user
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
