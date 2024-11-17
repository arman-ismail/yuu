class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn, null: false
      t.text :description
      
      t.timestamps
      
      t.index :isbn, unique: true
    end
  end
end