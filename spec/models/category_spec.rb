require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }
  context "Attributes" do
    it "is not valid without a category attribute" do
      category.name = nil
      expect(category).to be_invalid
    end
    it "is not valid without an icon attribute" do
      category.icon = nil
      expect(category).to be_invalid
    end
    it "name should be a string data type" do
      expect(category.name).to be_kind_of(String)
    end
    it "icon should be a string data type" do
      expect(category.icon).to be_kind_of(String)
    end
  end
end
