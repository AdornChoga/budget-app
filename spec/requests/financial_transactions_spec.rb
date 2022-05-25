require 'rails_helper'

RSpec.describe 'FinancialTransactions', type: :request do
  before(:all) do
    @user = create(:user)
    @category = create(:category, user_id: @user.id)
  end
  describe 'GET /index' do
    before(:example) do
      login_as @user
      get category_financial_transactions_path(@category.id)
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

  describe 'GET /new' do
    before(:example) do
      login_as @user
      get new_category_financial_transaction_path(@category.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the new category page' do
      expect(response).to render_template(:new)
    end
    it 'have New Transaction text in the body of the page' do
      expect(response.body).to include 'New Transaction'
    end
  end
end
