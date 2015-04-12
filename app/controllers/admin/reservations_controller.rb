class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.search(params[:q])
  end
end
