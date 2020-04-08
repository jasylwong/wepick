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
    click_button('Add a friend')
    expect(page).to have_content('signin_test@example.com')
    expect(page).to have_content('signin_test2@example.com')
  end

  scenario 'User can go straight to friends list only if already has friends' do
    sign_up('john@lennon.com', 'password')
    click_button 'Sign Out'
    sign_up('yoko@ono.com', 'password')
    click_button('Add a friend')
    expect(page).to have_content('john@lennon.com')
    click_button('Add friend', match: :first)
    click_button 'Sign Out'
    log_in('yoko@ono.com', 'password')
    click_button('Add a friend')
    expect(page).not_to have_content('john@lennon.com')
  end
end
