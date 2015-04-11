class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :user
      t.string :full_name
      t.string :english_name
      t.string :sid, index: true

      t.timestamps null: false
    end
  end
end
