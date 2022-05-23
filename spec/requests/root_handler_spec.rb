require 'rails_helper'

RSpec.describe "RootHandlers", type: :request do
  context "User not logged in" do
    before(:each) do
      get root_path
    end
    it "should redirect to splash screen" do
      expect(@responce).to redirect_to(splash_screen_index_path)
    end
  end
  context "User logged in" do
    before(:each) do
      @user = create(:user)
      login_as(@user)
      get root_path
    end
    it "should redirect to categories index page" do
      expect(@responce).to redirect_to(categories_index_path)
    end
  end
end
