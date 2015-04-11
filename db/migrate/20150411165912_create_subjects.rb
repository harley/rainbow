class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, index: true, unique: true

      t.timestamps null: false
    end
  end
end
