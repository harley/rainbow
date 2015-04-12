class Admin::MembersController < Admin::BaseController
  def index
    @members = Member.order('created_at DESC')
  end

  def show
    @member = Member.find params[:id]
  end
end
