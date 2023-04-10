require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'asdfasfd', bio: 'adfasfasdfasdf', posts_counter: 0) }

  before { subject.save }

  it 'No name should be invalid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Name length should be less than 50' do
    subject.name = 'b' * 55
    expect(subject).to_not be_valid
  end

  it 'Posts counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#recent posts' do
    it 'returns empty if user has no posts' do
      expect(subject.recent_posts).to be_empty
    end

    it 'Post count returns 3 posts' do
      subject.posts.create(title: 'Post One', text: 'Content One')
      subject.posts.create(title: 'Post Two', text: 'Content Two')
      subject.posts.create(title: 'Post Three', text: 'Content Three')
      expect(subject.posts.count).to eq(3)
    end

    it 'Recent comments returns 3 if it has more than 3' do
      post_one = subject.posts.create(title: 'Post One', text: 'Content One', created_at: 2.day.ago)
      post_two = subject.posts.create(title: 'Post Two', text: 'Content Two')
      post_three = subject.posts.create(title: 'Post Three', text: 'Content Three', created_at: 2.hour.ago)
      post_four = subject.posts.create(title: 'Post Four', text: 'Content Four', created_at: 2.hour.ago)

      recent_posts = subject.recent_posts
      expect(recent_posts).to eq([post_two, post_four, post_three])
      expect(recent_posts.size).to eq(3)
      expect(recent_posts).to_not include(post_one)
    end
  end
end
