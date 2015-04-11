class CreateSchoolLevels < ActiveRecord::Migration
  def change
    create_table :school_levels do |t|
      t.string :name, index: true, unique: true

      t.timestamps null: false
    end
  end
end
