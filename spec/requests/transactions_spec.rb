require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = create(:user)
      @category = create(:category, user_id: @user.id)
      get category_transactions_path(@category.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index page' do
      expect(response).to render_template(:index)
    end
    it 'have Transactions text in the body of the page' do
      expect(response.body).to include 'Transactions'
    end
  end

  # describe "GET /new" do
  #   it "returns http success" do
  #     get "/transactions/new"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/transactions/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
