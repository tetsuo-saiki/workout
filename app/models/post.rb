class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :tag_relations
  has_many :tags, through: :tag_relations, source: :tag
  has_many :like_relations
  has_many :liked_users, through: :like_relations, source: :user

  validates :post, presence: true, length: {maximum: 500}

  mount_uploader :image, PostImageUploader

  def add_tag(tag)
    self.tag_relations.find_or_create_by(tag_id: tag.id)
  end

  def detach_tag(tag)
    tag_relations = self.tag_relations.find_by(tag_id: tag.id)
    tag_relations.destroy if tag_relations
  end

  def tag_added?(tag)
    self.tags.include?(tag)
  end
end
