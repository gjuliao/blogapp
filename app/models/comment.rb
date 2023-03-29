class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_count
    post.comments_counter = comments.count
    save
  end
end
