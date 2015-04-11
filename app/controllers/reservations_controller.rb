class ReservationsController < ApplicationController
  def new
    @item = Item.find params[:item_id]
    @reservation = @item.reservations.build
    @reservation.due_date = 1.week.from_now.to_date
  end
end
