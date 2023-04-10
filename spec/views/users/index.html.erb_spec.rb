require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
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
      bio: 'Tech'
    )
  end

  it 'signs @user /users/ in home' do
    visit '/'
    expect(current_path).to eq(root_path)
  end

  it 'signs @user /users/ in home' do
    visit '/users'
    expect(current_path).to eq(users_path)
  end

  it 'We can see name of both users' do
    visit root_path
    expect(page).to have_text(user1.name)
    expect(page).to have_text(user2.name)
  end

  it 'Shows the number of posts of each user' do
    visit '/'
    expect(page).to have_text(/POST COUNT: #{user1.posts.count}/i)
  end

end
