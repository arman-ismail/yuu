class CreateBookClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :book_clubs do |t|
      t.string :name, null: false
      t.text :description
      
      t.timestamps
    end
  end
end