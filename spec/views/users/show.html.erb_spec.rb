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
end
