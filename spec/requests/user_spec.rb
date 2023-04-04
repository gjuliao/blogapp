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

    it 'body includes Here could be all the users' do
      get '/users'
      expect(response.body).to include('Here could be all the users')
    end
  end

  describe 'GET /show' do
    subject { get '/users/:id' }
    before { subject }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render the show page' do
      expect(response).to render_template(:show)
    end
  end
end
