class Admin::MembersController < Admin::BaseController
  def index
    @members = Member.search do
      fulltext(params[:search])
      if sorting_column && sorting_direction
        order_by(sorting_column, sorting_direction)
      end
      paginate(page: params[:page], per_page: params[:per_page])
    end
    @members = @members.results
  end

  def show
    @member = Member.find params[:id]
  end

  def view_as_reader
    session[:role] = 'reader'
    flash[:success] = "You are now viewing as #{session[:role]}"
    redirect_to :back
  end

  def view_as_admin
    session[:role] = 'admin' if current_admin
    flash[:success] = "You are now viewing as #{session[:role]}"
    redirect_to :back
  end
end
