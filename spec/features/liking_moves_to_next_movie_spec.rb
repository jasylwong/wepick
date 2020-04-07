require 'rails_helper'

RSpec.feature 'movie progression', type: :feature do
  scenario 'User can see another movie after liking one' do 
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(title: 'James Bond 1', genre: ['Action'], overview: 'test description', poster_path: 'https://image.tmdb.org/t/p/w500/testposter.jpg')
    Movie.create(title: 'James Bond 2', genre: ['Action'], overview: 'test description', poster_path: 'https://image.tmdb.org/t/p/w500/testposter.jpg')
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add friend', match: :first)
    click_link('Start Game')
    click_button('Action')
    click_button('Like')
    expect(page).to have_content('James Bond 2')
    expect(page).to have_content('test description')
    expect(page).to have_css("img[src*='/testposter.jpg']")
  end
end
