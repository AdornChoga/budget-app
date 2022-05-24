require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user_id: user.id) }
  context 'Attributes' do
    it 'is not valid without a category attribute' do
      category.name = nil
      expect(category).to be_invalid
    end
    it 'is not valid without an icon attribute' do
      category.icon = nil
      expect(category).to be_invalid
    end
    it 'name should be a string data type' do
      expect(category.name).to be_kind_of(String)
    end
    it 'icon should be a string data type' do
      expect(category.icon).to be_kind_of(String)
    end
  end

  context 'Associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:financial_transactions) }
  end

  context 'Methods' do
    before(:each) do
      @financial_transaction = create(:financial_transaction, user_id: user.id)
      @financial_transaction.categories << category
    end
    it 'returns total transanctions amounting to $1' do
      total_trans = category.total_transactions
      expect(total_trans).to eq 1
    end
  end
end
