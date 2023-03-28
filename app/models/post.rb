class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_comment_count
    self.comments_count = comments.count
    save
  end

  def update_likes_count
    self.likes_count = likes.count
  end
end
