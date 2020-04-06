require 'rails_helper'

RSpec.feature 'Resets to the first movie', type: :feature do
  scenario 'Movie resets to first movie, after clicking rematch button' do
    user = User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: '/testposter.jpg')
    movie = Movie.create(title: 'Aladdin', imdb_id: 'tt6105038', overview: 'test description', poster_path: '/testposter.jpg')
    Movie.create(title: 'Bambi', imdb_id: 'tt6105024', overview: 'test description', poster_path: '/testposter.jpg')
    MovieLike.create(movie_id: movie.id, user_id: user.id)
    
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add friend', match: :first)
    click_link('Start Game')
    click_button('Dislike')
    click_button('Like')
    expect(page).to have_selector(:link_or_button, "ReMatch")
    click_button('ReMatch')
    click_link('Start Game')
    expect(page).to have_content("Lion King")
  end 
end
