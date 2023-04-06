# rubocop:disable Layout/HashAlignment, Layout/ArgumentAlignment

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    context 'testing render posts' do
      user = User.create(name: 'Frank', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
             bio: 'Mathematician student.', posts_counter: 0)
      post = Post.create(title: 'Frank Paper', text: 'This is my first post', comments_counter: 0,
             likes_counter: 0, author_id: user)

      it 'renders a succesful response' do
        get "/users/#{user.id}/posts"
        expect(response).to be_successful
      end

      it 'returns http success' do
        get "/users/#{user.id}/posts"
        expect(response).to have_http_status(:success)
      end

      it 'should render the post index template' do
        get "/users/#{user.id}/posts"
        expect(response).to render_template(:index)
      end

      it 'include details of user name' do
        get "/users/#{user.id}/posts"
        expect(response.body).to include('Frank')
      end
    end
  end

  describe 'GET /show' do
    context 'Render posts' do
      user = User.create(name: 'Frank', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
             bio: 'Mathematician student.', posts_counter: 0)
      post = Post.create(title: 'Frank Paper', text: 'This is my first post', comments_counter: 0,
             likes_counter: 0, author_id: user)

      it 'returns http success' do
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response).to have_http_status(:success)
      end

      it 'Post should render post title details' do
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response.body).to include('Mathematician student.')
      end

      it 'Should render the show template' do
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response).to render_template(:show)
      end
    end
  end
end
