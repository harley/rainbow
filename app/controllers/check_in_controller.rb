class CheckInController < ApplicationController
  def index
    @reservations = Reservation.not_checked_in
  end

  def edit
    @reservation = Reservation.find params[:id]
  end
end
