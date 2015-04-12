class Admin::BaseController < ApplicationController
  before_action :require_admin!
  layout 'admin'

  def require_admin!
    authorize :admin, :base?
  end
end
