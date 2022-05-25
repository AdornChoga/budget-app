require 'rails_helper'

RSpec.describe 'CategoriesPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Visit categories index page' do
    before(:each) do
      visit 'user/sign_in'
      @user = create(:user, email: 'test@example.com')
      @category = create(:category, user_id: @user.id)
      login_as @user
      visit '/categories'
    end

    it 'should redirect to transactions index page' do
      click_link(@category.id.to_s)
      expect(page).to have_current_path("/categories/#{@category.id}/financial_transactions")
    end

    it 'should redirect to categoryies new page' do
      click_link 'New Category'
      expect(page).to have_current_path('/categories/new')
    end
  end

  describe 'Visit categories new page' do
    before(:each) do
      visit 'user/sign_in'
      @user = create(:user, email: 'test@example.com')
      @category = create(:category, user_id: @user.id)
      login_as @user
      visit '/categories/new'
    end

    it 'displays an error message is name field is blank' do
      click_button 'Create'
      expect(page).to have_content("Name can't be blank")
    end

    it 'should redirect to categoryies index page' do
      fill_in 'Category Name', with: 'Salary'
      click_button 'Create'
      expect(page).to have_current_path('/categories')
    end

    it 'displays a success message if all fields are filled in' do
      fill_in 'Category Name', with: 'Salary'
      click_button 'Create'
      expect(page).to have_content('Category was successfully created')
    end
  end
end
