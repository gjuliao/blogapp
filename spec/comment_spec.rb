require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    demo_user = User.new(name: 'Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Math Teacher grestest',
                     posts_counter: 0)
    Post.create(title: 'Greatest Teacher', text: 'Mi first post', likes_counter: 0, comments_counter: 0, author: demo_user)
  end

  it 'Comments counter should be 0' do
    expect(subject.comments_counter).to eq(0)
  end
end
