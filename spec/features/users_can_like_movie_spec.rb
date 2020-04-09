require 'rails_helper'

RSpec.feature 'liking movies', type: :feature do
  scenario 'User can like a movie' do
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: '/testposter.jpg', genre: ["Action"])
    Movie.create(id: 2, title: 'Aladdin', imdb_id: 'tt6105038', overview: 'test description', poster_path: '/testposter.jpg', genre: ["Action"])
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_button('Add a friend')
    click_button('Add friend', match: :first)
    click_button('Start')
    click_link('Action')
    click_button('Like')
    expect(MovieLike.count).to eq(1)
    expect(User.find_by(email: 'signin_test2@example.com').movie_counter).to eq(1)
  end

  scenario 'User can click on Quit Game button in nav bar' do
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: '/testposter.jpg', genre: ["Action"])
    Movie.create(id: 2, title: 'Aladdin', imdb_id: 'tt6105038', overview: 'test description', poster_path: '/testposter.jpg', genre: ["Action"])
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_button('Add a friend')
    click_button('Add friend', match: :first)
    click_button('Start')
    click_link('Action')
    click_button('Like')
    click_on('Quit Game')
    expect(current_path).to eq('/friendships/show')
  end
end
