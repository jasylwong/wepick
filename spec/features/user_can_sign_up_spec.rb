require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  
  scenario 'User can sign up' do
    sign_up("test@example.com", "example")
    expect(current_path).to eq('/users')
  end
end 
