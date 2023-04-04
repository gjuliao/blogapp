require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    subject { get '/users/:id/posts' }
    before { subject }

    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    subject { get '/users/:id/posts/:id' }
    before { subject }

    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should render the show template' do
      expect(response).to render_template(:show)
    end
  end
end
