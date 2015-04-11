class AddAvailableCountToItems < ActiveRecord::Migration
  def up
    add_column :items, :available_count, :integer
    Item.find_each(&:save) # to check available_count
  end

  def down
    remove_column :items, :available_count
  end
end
