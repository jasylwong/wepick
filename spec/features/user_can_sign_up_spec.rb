require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  
  scenario 'User can sign up' do
    sign_up("test@example.com", "example")
    expect(current_path).to eq('/users') 
  end

  scenario "User can't sign up with something with password less than 6 (inclusive) characters" do
    sign_up("test@example.com", "12345")
    expect(page).to have_content("Password is too short")
  end

  scenario "User can't sign up with something other than an email address" do
    sign_up("testexample.com", "example")
    expect(page).to have_content("Email is invalid")
  end

  scenario "Users passwords do not match" do 
    visit('/users/sign_up')
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password2"
    click_button("Sign up")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end 

  scenario "User does not fill in password confirmation when signing up" do 
    visit('/users/sign_up')
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "password"
    click_button("Sign up")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end 
end 
