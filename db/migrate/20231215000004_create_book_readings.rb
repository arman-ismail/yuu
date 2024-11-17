class CreateBookReadings < ActiveRecord::Migration[7.1]
  def change
    create_table :book_readings do |t|
      t.references :book_club, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date
      t.integer :status, default: 0
      
      t.timestamps
      
      t.index [:book_club_id, :book_id], unique: true
    end
  end
end