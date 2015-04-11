class AddQuantityToItems < ActiveRecord::Migration
  def change
    add_column :items, :quantity, :integer, default: 1, null: false
    add_column :items, :added_by_id, :integer
    add_index :items, :added_by_id
  end
end
