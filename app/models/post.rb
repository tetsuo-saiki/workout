class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :post, presence: true, length: {maximum: 500}

  mount_uploader :image, PostImageUploader
end
