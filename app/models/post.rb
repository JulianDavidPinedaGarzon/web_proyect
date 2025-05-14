class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  has_many :posts_hashtags
  has_many :hashtags, through: :posts_hashtags

  validates :image_path, presence: true
  validates :description, length: { maximum: 2000 }
  validates :user_id, presence: true
end