require 'rails_helper'

RSpec.describe 'LoginPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    visit 'user/sign_in'
    @user = create(:user, email: 'test@example.com')
  end

  context 'Missing credentials' do
    it 'returns an error if all fields are empty' do
      click_button 'Log In'
      expect(page).to have_content('Invalid Email or password')
    end
    it 'returns an error is one of the fields is empty' do
      fill_in 'Email', with: 'test@example.com'
      click_button 'Log In'
      expect(page).to have_content('Invalid Email or password')
    end
  end
  context 'Invalid credentials' do
    it 'displays an error if wrong email is provided' do
      fill_in 'Email', with: 'other@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      expect(page).to have_content('Invalid Email or password')
    end
    it 'displays an error if wrong password is provided' do
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'wrongpassword'
      click_button 'Log In'
      expect(page).to have_content('Invalid Email or password')
    end
  end

  context 'Valid credentials' do
    before(:each) do
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
    end

    it 'redirects to categories index page if all credentials are valid' do
      expect(page).to have_current_path('/categories')
    end
    it 'displays success message if all credentials are valid' do
      expect(page).to have_content('Signed in successfully')
    end
  end
end
