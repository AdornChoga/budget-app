require 'rails_helper'

RSpec.describe 'SplashScreens', type: :request do
  describe 'Get splash_screen/index' do
    before(:example) do
      get budget_app_path
    end
    it 'should render successfully' do
      expect(response).to have_http_status(:success)
    end
    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
    it 'should have login text in body' do
      expect(response.body).to include 'LOG IN'
    end
    it 'should have sign up text in body' do
      expect(response.body).to include 'SIGN UP'
    end
  end
end
