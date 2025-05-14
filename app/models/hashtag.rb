class Hashtag < ApplicationRecord
  has_many :posts_hashtags
  has_many :posts, through: :posts_hashtags

  validates :name, presence: true, uniqueness: true
end