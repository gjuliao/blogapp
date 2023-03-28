class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_comments_count
    self.comments_counter = comments.count
    save
  end

  def update_likes_count
    self.likes_counter = likes.count
    save
  end
end
