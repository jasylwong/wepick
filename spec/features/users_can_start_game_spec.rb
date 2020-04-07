require 'rails_helper'

RSpec.feature 'start game', type: :feature do
  scenario 'User can add friends' do
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: '/testposter.jpg', genre: ["Action"])
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add friend', match: :first)
    expect(current_path).to eq('/friendships/show')
    expect(page).to have_content('signin_test@example.com')
    click_link('Start Game')
    click_button('Action')
    expect(page).to have_content("Lion King")
  end

end
