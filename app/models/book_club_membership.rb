class BookClubMembership < ApplicationRecord
  belongs_to :user
  belongs_to :book_club
  
  validates :role, presence: true
  
  enum role: { member: 0, moderator: 1, admin: 2 }
end