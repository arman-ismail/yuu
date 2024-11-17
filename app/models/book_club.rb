class BookClub < ApplicationRecord
  has_many :book_club_memberships
  has_many :users, through: :book_club_memberships
  has_many :book_readings
  has_many :books, through: :book_readings
  
  validates :name, presence: true
  validates :description, presence: true
end