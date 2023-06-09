class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  def update_post_likes_count
    post.likes_counter = post.likes.count
    save
  end
end
