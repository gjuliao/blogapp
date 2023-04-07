require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    subject { get '/users' }
    before { subject }

    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'should render the index page' do
      expect(response).to render_template(:index)
    end

    it 'body includes Here could be Users' do
      get '/users'
      expect(response.body).to include('Users List')
    end
  end

  describe 'GET /show' do
    context 'Render posts' do
      user = User.create(name: 'Frank', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Mathematician student.', posts_counter: 0)

      it 'returns http success' do
        get "/users/#{user.id}"
        expect(response).to have_http_status(:success)
      end

      it 'should render the show page' do
        get "/users/#{user.id}"
        expect(response).to render_template(:show)
      end
    end
  end
end
