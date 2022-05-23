require 'rails_helper'

RSpec.describe FinancialTransaction, type: :model do
  let(:user) { create(:user) }
  let(:financial_transaction) { create(:financial_transaction, user_id: user.id) }

  context "Attributes" do
    it "is not valid without name attribute" do
      financial_transaction.name = nil
      expect(financial_transaction).to be_invalid
    end
    it "is not valid without amount attribute" do
      financial_transaction.amount = nil
      expect(financial_transaction).to be_invalid
    end
    it "name should be a string data type" do
      expect(financial_transaction.name).to be_kind_of(String)
    end
    it "amount should be a float data type" do
      expect(financial_transaction.amount).to be_kind_of(BigDecimal)
    end
  end
end
