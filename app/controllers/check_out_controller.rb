class CheckOutController < ApplicationController
  def index
    @reservations = Reservation.not_checked_out
  end

  def edit
    @reservation = Reservation.find params[:id]
  end

  def update
    @reservation = Reservation.find params[:id]
    @reservation.checked_out_at = Time.now
    @reservation.checked_out_by = current_user
    if @reservation.save
      flash[:success] = "Checked out successfully."
      redirect_to @reservation
    else
      render action: 'edit'
    end
  end
end
