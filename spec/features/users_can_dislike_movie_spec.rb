require 'rails_helper'

RSpec.feature 'liking movies', type: :feature do
  scenario 'User can like a movie' do
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(title: 'Lion King', imdb_id: 'tt6105098')
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add friend', match: :first)
    click_link("Start Game")
    click_button('Dislike')
    click_button('Dislike')
    expect(MovieLike.count).to eq(0)
    expect(User.find_by(email: "signin_test2@example.com").movie_counter).to eq(2)
  end
end
