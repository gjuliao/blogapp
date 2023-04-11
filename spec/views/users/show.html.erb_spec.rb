require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  let!(:user) do
    User.create(
      name: 'Gio',
      photo: 'https://www.bing.com/th?id=ODL.c83b34c2350e6cd3a1010f7d1998cfa8&w=143&h=198&c=12&rs=1&qlt=99&pcl=faf9f7&o=6&pid=13.1',
      bio: 'CTO'
    )
  end
  let!(:post1) do
    Post.create(
      author_id: user.id,
      title: 'Post Test One',
      text: 'this is my first post'
    )
  end
  let!(:post2) do
    Post.create(
      author_id: user.id,
      title: 'Post Test Two',
      text: 'this is my second post'
    )
  end
  let!(:post3) do
    Post.create(
      author_id: user.id,
      title: 'Post Test Three',
      text: 'this is my third post'
    )
  end
  let!(:post4) do
    Post.create(
      author_id: user.id,
      title: 'Post Test Four',
      text: 'this is my  fourth post'
    )
  end

  before(:each) do
    visit user_path(user)
  end

  it 'Renders the profile pic of user' do
    expect(page).to have_xpath("//img[@src = '#{user.photo}']")
  end

  it 'Shows user name' do
    expect(page).to have_text(user.name)
  end

  it 'Can show the posts of a user' do
    expect(page).to have_content(/posts/i)
  end

  it 'Can see user bio' do
    expect(page).to have_text(user.bio)
  end

  it 'Can see button with text See All Posts' do
    expect(page).to have_text(/See All Posts/i)
  end

  it 'Click See All posts, redirects to a all posts of that user' do
    click_on 'See All Posts'
    expect(page).to have_current_path(user_posts_path(user))
  end

  it 'Redirects when clicking on a post' do
    visit user_posts_path(user)
    click_on post1.title
    expect(page).to have_current_path(user_post_path(user, post1))
  end

  it 'shows the three posts of each user' do
    expect(page).to_not have_content(post1.text)
    expect(page).to have_content(post2.text)
    expect(page).to have_content(post3.text)
    expect(page).to have_content(post3.text)
  end
end
