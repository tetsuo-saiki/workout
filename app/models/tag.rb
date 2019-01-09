class Tag < ApplicationRecord
  has_many :tag_relations
  has_many :posts, through: :tag_relations, source: :post

  validates :tag, presence: true, length: {maximum: 10}
end