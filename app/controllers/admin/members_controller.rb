class Admin::MembersController < Admin::BaseController
  def index
    @members = Member.search do
      fulltext(params[:search])
      if sorting_column && sorting_direction
        order_by(sorting_column, sorting_direction)
      end
    end
    @members = @members.results
  end

  def show
    @member = Member.find params[:id]
  end
end
