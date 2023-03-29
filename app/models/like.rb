class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  def update_likes_count
    post.likes_counter = likes.count
    save
  end
end
