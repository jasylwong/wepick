require 'rails_helper'

RSpec.feature 'disliking movies', type: :feature do
  scenario 'User can dislike a movie' do
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: '/testposter.jpg', genre: ["Action"])
    Movie.create(id: 2, title: 'Aladdin', imdb_id: 'tt6105038', overview: 'test description', poster_path: '/testposter.jpg', genre: ["Action"])
    Movie.create(id: 3, title: 'Hercules', imdb_id: 'tt6105032', overview: 'test description', poster_path: '/testposter.jpg', genre: ["Action"])
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_button('Add a friend')
    click_button('Add friend', match: :first)
    click_button('Start')
    click_link('Action')
    click_button('Dislike')
    click_button('Dislike')
    expect(MovieLike.count).to eq(0)
    expect(User.find_by(email: "signin_test2@example.com").movie_counter).to eq(2)
  end
end
