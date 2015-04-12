class Admin::MembersController < Admin::BaseController
  def index
    @members = Member.search(params[:q]).sort(sorting_column, sorting_direction)
  end

  def show
    @member = Member.find params[:id]
  end
end
