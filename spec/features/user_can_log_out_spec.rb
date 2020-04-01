require 'rails_helper'

RSpec.feature "Log out", type: :feature do 
  scenario "User can log out" do 
    create_test_user_and_login("test@example.com", "example")
    click_link("Sign Out")
    expect(current_path).to eq('/users/sign_in')
  end 
end
