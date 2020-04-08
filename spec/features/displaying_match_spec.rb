require 'rails_helper'

RSpec.feature 'displaying match', type: :feature do
  scenario 'user can see a display message once matched' do 
    user = User.create(email: 'signin_test@example.com', password: '123456')
    movie_one = Movie.create(title: 'James Bond 1', genre: ['Action'], imdb_id: "tt2935510")
    Movie.create(title: 'James Bond 2', genre: ['Action'], imdb_id: "tt2935510")
    MovieLike.create(movie_id: movie_one.id, user_id: user.id)    
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_button('Add a friend')
    click_button('Add friend', match: :first)
    click_button('Start Game')
    click_button('Action')
    click_button('Like')
    expect(page).to have_content('You Matched')
    expect(page).to have_content('James Bond 1')
  end 
end
