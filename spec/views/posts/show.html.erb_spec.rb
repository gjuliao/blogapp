require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
  let!(:user) do
    User.create(
      name: 'Gio',
      photo: 'https://www.bing.com/th?id=ODL.c83b34c2350e6cd3a1010f7d1998cfa8&w=143&h=198&c=12&rs=1&qlt=99&pcl=faf9f7&o=6&pid=13.1',
      bio: 'CTO'
    )
  end

  let!(:post) do
    Post.create(
      author_id: user.id,
      title: 'Title Post One',
      text: 'this is my first post'
    )
  end

  let!(:comment) do
    Comment.create(
      post_id: post.id,
      author_id: user.id,
      text: 'This is my first comment'
    )
  end

  let!(:like) do
    Like.create(
      post_id: post.id,
      author_id: user.id
    )
  end

  before(:each) do
    visit user_posts_path(user, post)
  end

  it 'Checking correct post title' do
    expect(page).to have_content(post.title)
  end

  it 'Checking correct user name' do
    expect(page).to have_content(user.name)
  end

  it 'Checking for available comments' do
    expect(page).to have_content('Comments: 1')
  end

  it 'Checking for available Likes' do
    expect(page).to have_content('Likes: 1')
  end

  it 'Checking for post body' do
    expect(page).to have_content(post.text)
  end

  it 'Checking for username in comments body' do
    expect(page).to have_content(user.name)
  end

  it 'Checking for text in comments' do
    expect(page).to have_content(comment.text)
  end
end
