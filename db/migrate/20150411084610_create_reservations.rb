class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :item, index: true, foreign_key: true
      t.integer :reserver_id
      t.integer :checked_out_by_id
      t.integer :checked_in_by_id
      t.datetime :checked_out_at
      t.datetime :checked_in_at
      t.datetime :due_date

      t.timestamps null: false
    end
  end
end
