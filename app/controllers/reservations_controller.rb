class ReservationsController < ApplicationController
  def index
    redirect_to '/admin/reservation'
  end

  def show
    @reservation = Reservation.find params[:id]
  end

  def new
    @item = Item.find params[:item_id]
    @reservation = @item.reservations.build
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
