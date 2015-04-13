class CheckOutController < ApplicationController
  def index
    @reservations = Reservation.not_checked_out
  end

  def edit
    @reservation = Reservation.find params[:id]
    authorize @reservation
    if @reservation.checked_out?
      flash[:error] = "This reservation has been checked out before (by #{@reservation.checked_out_by})"
      redirect_to @reservation
    end
  end

  def update
    @reservation = Reservation.find params[:id]
    @reservation.notes = params[:reservation][:notes]
    @reservation.check_out_by!(current_user)
    if @reservation.errors.empty?
      flash[:success] = "Checked out successfully."
      redirect_to @reservation.item
    else
      render action: 'edit'
    end
  end
end
