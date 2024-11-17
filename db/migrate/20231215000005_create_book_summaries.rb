class CreateBookSummaries < ActiveRecord::Migration[7.1]
  def change
    create_table :book_summaries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :book_club, null: false, foreign_key: true
      t.text :content, null: false
      t.integer :rating, null: false
      
      t.timestamps
    end
  end
end