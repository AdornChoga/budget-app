require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/categories'
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

  describe 'GET /new' do
    before(:each) do
      get '/categories/new'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index page' do
      expect(response).to render_template(:new)
    end
    it 'index page has New Category text' do
      expect(response.body).to include 'New Category'
    end
  end
end
