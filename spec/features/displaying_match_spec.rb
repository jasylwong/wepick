require 'rails_helper'

RSpec.feature 'displaying match', type: :feature do
  scenario 'user can see a display message once matched' do 
    User.create(id: 1, email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: '/testposter.jpg')
    Movie.create(id: 2, title: 'Aladdin', imdb_id: 'tt6105038', overview: 'test description', poster_path: '/testposter.jpg')
    MovieLike.create(id: 1, movie_id: 1, user_id: 1)
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add friend', match: :first)
    click_link("Start Game")
    click_button('Like')
    expect(page).to have_content("You Matched")
  end 
end
