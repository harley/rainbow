class AddCheckInOutNotesToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :check_in_notes, :text
    add_column :reservations, :check_out_notes, :text
  end
end
