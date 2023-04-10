require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      user = User.create(name: 'Frank', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Mathematician student.', posts_counter: 0)
      post = Post.create(title: 'Frank Paper', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0, author: user)

      get "/users/#{user.id}/posts/#{post.id}/likes/new"
      expect(response).to have_http_status(:success)
    end
  end
end
