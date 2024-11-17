class BookReading < ApplicationRecord
  belongs_to :book_club
  belongs_to :book
  
  validates :start_date, presence: true
  validates :status, presence: true
  
  enum status: { planned: 0, in_progress: 1, completed: 2 }
end