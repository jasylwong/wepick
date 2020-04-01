require 'rails_helper'
RSpec.feature 'adding friends', type: :feature do
  scenario 'User can add friends' do
    User.create(id: 1, email: 'signin_test@example.com', password: '123456')
    User.create(id: 2, email: 'signin_test2@example.com', password: '123456')
    visit '/users/sign_up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button 'Sign up'
    click_link('Add friend', match: :first)
    expect(current_path).to eq('/friendships/index')    
  end
end
