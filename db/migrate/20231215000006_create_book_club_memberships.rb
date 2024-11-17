class CreateBookClubMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :book_club_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book_club, null: false, foreign_key: true
      t.integer :role, default: 0
      
      t.timestamps
      
      t.index [:user_id, :book_club_id], unique: true
    end
  end
end