require 'rails_helper'

RSpec.feature 'viewing movie', type: :feature do
  scenario 'User can see a movie' do 
    User.create(email: 'signin_test@example.com', password: '123456')
    Movie.create(id: 1, title: 'Aladdin', imdb_id: 'test_id', overview: "thief steals princess' heart", poster_path: '/aladdin.jpg')
    Movie.create(id: 2, title: 'Lion King', imdb_id: 'tt6105098', overview: 'test description', poster_path: '/testposter.jpg')
    create_test_user_and_login('signin_test2@example.com', '123456')
    click_link('Add friend', match: :first)
    click_link("Start Game")
    click_button("Like")
    expect(page).to have_content('Lion King')
    expect(page).to have_content('test description')
    expect(page).to have_css("img[src*='/testposter.jpg']")
  end
end
