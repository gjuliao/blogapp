class User < ApplicationRecord
  has_many :posts

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_count
    self.posts_count = posts.count
    save
  end
end
