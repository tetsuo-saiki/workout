class Post < ApplicationRecord
  belongs_to :user

  validates :post, presence: true, length: { in: 1..500 }
end
