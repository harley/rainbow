class ReservationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @member = current_user.member
    @reservations = current_user.reservations
  end

  def show
    @reservation = Reservation.find params[:id]
  end

  def new
    @item = Item.find params[:item_id]
    @reservation = @item.reservations.build
    authorize @reservation
    @reservation.member = current_user.member if reader?
    @reservation.due_date = 1.week.from_now.to_date
  end

  def create
    @item = Item.find params[:item_id]
    @reservation = @item.reservations.build reservation_params
    if @reservation.save
      # TODO: change this path
      redirect_to @item
    else
      render action: 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit!
  end
end
