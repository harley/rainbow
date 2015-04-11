class AddFieldsToItems < ActiveRecord::Migration
  def change
    add_reference :items, :category, index: true, foreign_key: true
    add_reference :items, :subject, index: true, foreign_key: true
    add_reference :items, :school_level, index: true, foreign_key: true
  end
end
