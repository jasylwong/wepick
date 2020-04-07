require 'rails_helper'

RSpec.feature 'Displaying genres', type: :feature do

  scenario 'user can pick a genre' do
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Lion King')
    Movie.create(id: 2, title: 'Bambi')
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add a friend')
    click_link('Add friend', match: :first)
    click_link("Start Game")
    expect(page).to have_content("Pick a category")
    expect(page).to have_selector(:link_or_button, "Action")
  end

  scenario 'after picking a genre, user should go back to index' do
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Lion King', genre: ['Family'])
    Movie.create(id: 2, title: 'Transformers', genre: ['Action'])
    Movie.create(id: 3, title: 'James Bond', genre: ['Action'])
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add a friend')
    click_link('Add friend', match: :first)
    click_link('Start Game')
    click_button('Action')
    expect(page).to have_content('Transformers')
  end

  scenario 'user can select all genres' do
    User.create(email: 'signin_test@example.com', password: '123456', current_genre_deck: "All")
    Movie.create(id: 1, title: 'Lion King', genre: ['Family'])
    Movie.create(id: 2, title: 'Transformers', genre: ['Action'])
    Movie.create(id: 3, title: 'James Bond', genre: ['Spy'])
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add a friend')
    click_link('Add friend', match: :first)
    click_link('Start Game')
    expect(page).to have_content("signin_test@example.com has chosen All, Please pick the same category")
    click_button('All')
    expect(page).to have_content('Lion King')
    click_button('Dislike')
    expect(page).to have_content('Transformers')
  end
end
