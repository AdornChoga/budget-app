require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/categories/index'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index page' do
      expect(response).to render_template(:index)
    end
    it 'index page has Categores text' do
      expect(response.body).to include 'Categories'
    end
  end
end
