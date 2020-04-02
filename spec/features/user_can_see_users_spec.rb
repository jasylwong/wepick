require 'rails_helper'

RSpec.feature 'User can see users', type: :feature do
  scenario 'User can see a list of users' do
    User.create(email: 'signin_test@example.com', password: '123456')
    User.create(email: 'signin_test2@example.com', password: '123456')
    visit '/users/sign_up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button 'Sign up'
    expect(page).to have_content('signin_test@example.com')
    expect(page).to have_content('signin_test2@example.com')
  end
end