require 'rails_helper'

RSpec.describe 'SplashScreens', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Clicking on the login button' do
    before(:each) do
      visit '/budget_app'
    end
    it 'should redirect to the login page' do
      click_link 'LOG IN'
      expect(page).to have_current_path('/user/sign_in')
    end
    it 'should redirect to the login page' do
      click_link 'SIGN UP'
      expect(page).to have_current_path('/user/sign_up')
    end
  end
end
