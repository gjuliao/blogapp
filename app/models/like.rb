class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_count
    post.likes_counter = likes.count
    save
  end
end
