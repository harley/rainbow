class MembersController < ApplicationController
  def edit
    @member = Member.find params[:id]
  end

  def update
    @member = Member.find params[:id]
    if @member.update_attributes member_params
      flash[:success] = "Changes saved."
    else
      flash[:error] = "Error: #{@member.errors.full_messages.to_sentence}."
    end
    redirect_to :back
  end

  private
  def member_params
    params.require(:member).permit!
  end
end
