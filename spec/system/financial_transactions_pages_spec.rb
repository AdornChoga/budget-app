require 'rails_helper'

RSpec.describe 'FinancialTransactionsPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = create(:user, email: 'test@example.com')
    @category = create(:category, user_id: @user.id)
    @path = "/categories/#{@category.id}/financial_transactions"
    login_as @user
  end

  describe 'Visit categories index page' do
    before(:each) { visit @path }

    it 'should redirect to financial_transactions new page' do
      click_link 'New Transaction'
      expect(page).to have_current_path("#{@path}/new")
    end
  end

  describe 'Visit financial_transactions new page' do
    before(:each) { visit "#{@path}/new" }

    it 'displays an error message if all fields are blank' do
      click_button 'Create'
      expect(page).to have_content("Name can't be blank")
    end

    it 'displays an error message if name field is blank' do
      fill_in 'Amount ($)', with: 12
      click_button 'Create'
      expect(page).to have_content("Name can't be blank")
    end

    it 'displays an error message if amount field is blank' do
      fill_in 'Transaction Name', with: 'Fruits'
      click_button 'Create'
      expect(page).to have_content("Amount can't be blank")
    end

    it 'should redirect to transactions index page if all fields are filled in' do
      fill_in 'Transaction Name', with: 'Fruits'
      fill_in 'Amount ($)', with: 12
      click_button 'Create'
      expect(page).to have_current_path(@path)
    end

    it 'displays a success message if all fields are filled in' do
      fill_in 'Transaction Name', with: 'Fruits'
      fill_in 'Amount ($)', with: 12
      click_button 'Create'
      expect(page).to have_content('Transaction was created successfully')
    end
  end
end
