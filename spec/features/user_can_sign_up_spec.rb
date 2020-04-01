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
end 
