class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_count
    post.comments_counter = comments.count
    save
  end
end
