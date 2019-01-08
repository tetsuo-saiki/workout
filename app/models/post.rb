class Post < ApplicationRecord
  belongs_to :user

  validates :post, presence: true, length: {maximum: 500}

  mount_uploader :image, PostImageUploader
end
