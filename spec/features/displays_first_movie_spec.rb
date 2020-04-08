require 'rails_helper'

RSpec.feature 'Resets to the first movie', type: :feature do
  scenario 'Movie resets to first movie, after clicking rematch button' do
    user = User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(title: 'James Bond 1', genre: ['Action'])
    movie_two = Movie.create(title: 'James Bond 2', genre: ['Action'])
    Movie.create(title: 'James Bond 3', genre: ['Action'])
    MovieLike.create(movie_id: movie_two.id, user_id: user.id)
    
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_button('Add a friend')
    click_button('Add friend', match: :first)
    click_button('Start Game')
    click_link('Action')
    click_button('Dislike')
    click_button('Like')
    expect(page).to have_selector(:link_or_button, 'ReMatch')
    click_button('ReMatch')
    click_button('Start Game')
    click_link('Action')
    expect(page).to have_content('James Bond 1')
  end 
end
