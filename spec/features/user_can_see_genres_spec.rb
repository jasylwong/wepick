require 'rails_helper'

RSpec.feature 'Displaying genres', type: :feature do
  scenario 'user can pick a genre' do
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: '/testposter.jpg')
    Movie.create(id: 2, title: 'Bambi', imdb_id: 'tt6105024', overview: 'test description', poster_path: '/testposter.jpg')

    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add friend', match: :first)
    click_link("Start Game")
    expect(page).to have_content("Pick a genre")
    expect(page).to have_selector(:link_or_button, "Action")
  end
end
