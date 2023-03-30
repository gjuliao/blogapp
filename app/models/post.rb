class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: {
    maximum: 250,
    too_long: '250 characters is the maximum allowed'
  }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_comments_count
    self.comments_counter = comments.count
    save
  end
end
