class BookSummary < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :book_club
  
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end