class Admin::ReservationsController < Admin::BaseController
  def index
    @reservations = Reservation.search(params[:q])
    @reservations = @reservations.sort(sorting_column, sorting_direction) if params[:sort]
  end
end
