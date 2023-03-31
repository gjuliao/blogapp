class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  # Validations
  validates :title, presence: true, length: { maximum: 250 }, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: false }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_posts_count
    author.posts_counter = author.posts.count
    save
  end
end
