require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user1 = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
    Post.create(title: 'Greatest Teacher', text: 'Mi first post', likes_counter: 0, comments_counter: 0, author: user1)
  end

  it 'Likes_counter should be 0' do
    expect(subject.likes_counter).to eq(0)
  end
end
