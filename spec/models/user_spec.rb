require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  context 'Attributes' do
    it 'is not valid without a name' do
      user.name = nil
      expect(user).to be_invalid
    end
    it 'name should be a string' do
      expect(user.name).to be_kind_of(String)
    end
  end

  context 'Associations' do
    it { should have_many(:categories) }
    it { should have_many(:financial_transactions) }
  end
end
