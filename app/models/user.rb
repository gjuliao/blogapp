class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments
  has_many :likes

  # Validations
  validates :name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
