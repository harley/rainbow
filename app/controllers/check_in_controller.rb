class CheckInController < ApplicationController
  def index
    @reservations = Reservation.not_checked_in
  end

  def edit
    @reservation = Reservation.find params[:id]
    if @reservation.checked_in?
      flash[:error] = "This reservation has been checked in before (by #{@reservation.checked_out_by})"
      redirect_to @reservation
    end
  end

  def update
    @reservation = Reservation.find params[:id]
    @reservation.notes = params[:reservation][:notes]
    @reservation.check_in_by!(current_user)
    if @reservation.errors.empty?
      flash[:success] = "Checked in successfully"
      redirect_to @reservation.item
    else
      render action: 'edit'
    end
  end
end
