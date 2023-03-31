class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_posts_comment_count
    post.comments_counter = post.comments.count
    save
  end
end
