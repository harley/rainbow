class RenameReserverIdInReservations < ActiveRecord::Migration
  def change
    rename_column :reservations, :reserver_id, :member_id
  end
end
