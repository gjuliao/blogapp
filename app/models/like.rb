class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  validate :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_likes_count
    post.likes_counter = likes.count
    save
  end
end
