require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  let!(:user1) do
    User.create(
      name: 'Gio',
      photo: 'https://www.bing.com/th?id=ODL.c83b34c2350e6cd3a1010f7d1998cfa8&w=143&h=198&c=12&rs=1&qlt=99&pcl=faf9f7&o=6&pid=13.1',
      bio: 'CTO'
    )
  end

  let!(:user2) do
    User.create(
      name: 'Frank',
      photo: 'https://th.bing.com/th?q=Shahin+Artist&w=120&h=120&c=1&rs=1&qlt=90&cb=1&pid=InlineBlock&mkt=en-WW&cc=AF&setlang=en&adlt=strict&t=1&mw=247',
      bio: 'Manager'
    )
  end

  let!(:post1) do
    Post.create(
      author_id: user1.id,
      title: 'Title Post One',
      text: 'this is my first post'
    )
  end

  let!(:post2) do
    Post.create(
      author_id: user1.id,
      title: 'Title Post Two',
      text: 'this is my second post'
    )
  end

  let!(:post3) do
    Post.create(
      author_id: user1.id,
      title: 'Title Post Three',
      text: 'this is my third post'
    )
  end

  let!(:post4) do
    Post.create(
      author_id: user1.id,
      title: 'Title Post Four',
      text: 'this is my fourth post'
    )
  end

  let!(:comment) do
    Comment.create(
      post_id: post3.id,
      author_id: user1.id,
      text: 'This is my first comment'
    )
  end

  let!(:like) do
    Like.create(
      post_id: post3.id,
      author_id: user1.id
    )
  end

  before(:each) do
    visit user_posts_path(user1)
  end

  it 'Checking for the right user name' do
    expect(page).to have_text('Gio')
  end

  it 'Checking for user profiles picture' do
    expect(page).to have_xpath("//img[@src = '#{user1.photo}']")
  end

  it 'Checking for showing user posts' do
    expect(page).to have_content(/POST COUNT: 4/i)
  end

  it 'Checking for correct post title' do
    expect(page).to have_content(post3.title)
  end

  it 'Checking for correct post text' do
    expect(page).to have_content(post3.text)
  end

  it 'Checking for comment in post' do
    expect(page).to have_content('Comments: 1')
  end

  it 'Checking for likes in post' do
    expect(page).to have_content('Likes: 1')
  end

  it 'Checking for pagination button' do
    expect(page).to have_link('Pagination')
  end

  it 'Redirecting to post show page' do
    click_on post2.title
    expect(page).to have_content("Post by: #{user1.name} Post Title: #{post2.title}")
  end
end
