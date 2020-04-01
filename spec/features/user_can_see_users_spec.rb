require 'rails_helper'
RSpec.feature 'User can see users', type: :feature do
  scenario 'User can see a list of users' do
    visit '/users/sign_up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button 'Sign up'
    expect(page).to have_content('Welcome')
  end
end
