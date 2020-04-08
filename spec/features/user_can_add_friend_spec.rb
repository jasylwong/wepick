require 'rails_helper'

RSpec.feature 'adding friends', type: :feature do
  scenario 'User can add friends' do
    User.create(email: 'signin_test@example.com', password: '123456')
    User.create(email: 'signin_test2@example.com', password: '123456')
    visit '/users/sign_up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button 'Sign up'
    click_button('Add a friend')
    click_button('Add friend', match: :first)
    expect(current_path).to eq('/friendships/show')
    expect(page).to have_content('signin_test@example.com')    
  end

  scenario 'User can not add someone they are already friends with' do
    sign_up('david@beckham.com', 'password')
    click_on 'Sign Out'
    sign_up('victoria@beckham.com', 'password')
    click_button('Add a friend')
    expect(page).to have_content('david@beckham.com')
    click_button('Add friend', match: :first)
    click_on 'Sign Out'
    log_in('victoria@beckham.com', 'password')
    expect(page).to have_content('david@beckham.com')
  end
end
