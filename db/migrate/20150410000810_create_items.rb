class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :kind
      t.string :author
      t.text :summary
      t.integer :number_of_pages
      t.string :image
      t.string :code, index: true, unique: true
      t.string :publisher

      t.timestamps null: false
    end
  end
end
