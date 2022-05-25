require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  before(:each) do
    @user = create(:user)
    @category = create(:category, user_id: @user.id)
  end
  describe 'GET /index' do
    before(:example) { get category_transactions_path(@category.id) }

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

  describe "GET /new" do
    before(:example) { get new_category_transaction_path(@category.id) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it 'renders the new category page' do
      expect(response).to render_template(:new)
    end
    it 'have New Transaction text in the body of the page' do
      expect(response.body).to include 'New Transaction'
    end
  end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/transactions/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
