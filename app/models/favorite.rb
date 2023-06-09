class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :book
  
  validates :user_id, uniqueness: { scope: :book_id, message: 'は同じ投稿に一つしかいいねできません' }
end
