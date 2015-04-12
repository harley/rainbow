class Admin::BaseController < ApplicationController
  before_action :require_admin!
  layout 'admin'

  helper_method :sorting_column
  helper_method :sorting_direction

  def require_admin!
    authorize :admin, :base?
  end

  def sorting_column
    params[:sort][/^\-?(.+)/, 1] if params[:sort].present?
  end

  def sorting_direction
    params[:sort] =~ /^\-/ ? :desc : :asc if params[:sort].present?
  end
end
