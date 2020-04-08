require 'rails_helper'

RSpec.feature 'viewing movie', type: :feature do
  scenario 'User can see a movie' do 
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: 'https://image.tmdb.org/t/p/w500/testposter.jpg', genre: ['Action'])
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_button('Add a friend')
    click_button('Add friend', match: :first)
    click_button('Start Game')
    click_button('Action')
    expect(page).to have_content('Lion King')
    expect(page).to have_content('test description')
    expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/w500/testposter.jpg']")
  end
end
