class Book < ApplicationRecord
  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books
  validates :title, :author, :price, :published_date, presence: true
end
