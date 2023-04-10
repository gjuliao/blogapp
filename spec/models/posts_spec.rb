# rubocop:disable Lint/Syntax
require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    author = User.new(
      name: 'Jerry Seinfield',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Math Teacher',
      posts_counter: 5
    )
    Post.new(author: author, title: 'Greatest Teacher', text: 'This is my first teachers post', comments_counter: 3,
             likes_counter: 9)
  end

  it 'post should be valid' do
    expect(subject).to be_valid
  end

  it 'post title should be Greatest Teacher' do
    expect(subject.title).to eq('Greatest Teacher')
  end

  it 'post should be invalid if title = nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Invalid if negative comments_counter' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post should be invalid if title length > 250 characters' do
    subject.title = '
    Coding is the process of writing instructions in a programming language for a computer to execute.
    It requires attention to detail, problem-solving skills, and logical thinking. Learning to code is a valuable
    investment in career and personal growth, offering opportunities for innovation and creativity.
    '
    expect(subject).to_not be_valid
  end

  it 'Invalid if comments_counter = nil' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'post should be valid' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'Invalid if negative likes_counter' do
    subject.likes_counter = -3
    expect(subject).to_not be_valid
  end

  context 'Increments with variables' do
    let(:author) { User.create(name: 'Naming Convention One', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.') }
    let(:user) { User.create(name: 'Naming Two', photo: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?&fit=crop&w=640', bio: 'A licensed therapist with expertise in cognitive-behavioral therapy and trauma-informed care.', posts_counter: 5) }
  
    let(:post) { Post.create(title: 'First Post', text: 'First Content', author: ) }
    it 'increment post counter after creating new post' do
      expect(user.posts_counter).to eq(5)
    end
  end
end
