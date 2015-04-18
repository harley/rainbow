class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  helper_method :current_admin
  helper_method :current_role
  helper_method :reader?
  # layout :layout_per_role

  protected
  def current_admin
    current_user.try(:admin?) && current_user
  end

  # use to determine layout
  def current_role
    return session[:role] if session[:role]
    session[:role] = current_user.try(:role)
  end

  def reader?
    current_role == 'reader'
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def layout_per_role
    current_role == 'admin' ? 'admin' : 'application'
  end
end
