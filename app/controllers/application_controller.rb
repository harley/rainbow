class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
end
