class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @borrowed = @reservations.borrowed
    @returned = @reservations.returned
    @reserved = @reservations.reserved
  end
end
