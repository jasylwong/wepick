class GamesController < ApplicationController
  include GamesHelper

  # rubocop:disable Metrics/AbcSize
  def new
    session[:friend_id] = params[:friend_id]
    friend = User.find(session[:friend_id])
    MovieLike.where(user_id: current_user.id).destroy_all
    User.where(id: current_user.id).update_all(movie_counter: 0)
    session[:message] = genre_message(friend)
    redirect_to '/games/preferences'
  end 

  def create
  end

  def index
    User.where(id: current_user.id).update_all(current_genre_deck: params[:genre]) unless params[:genre].nil?
    session[:genre] = params[:genre] unless params[:genre].nil?
    movies_by_genre = Movie.where('genre LIKE ?', "%#{session[:genre]}%").to_a
    movies_id_arr = movies_by_genre.map { |movie| movie.id }
    @match, @movie, @where_to_watch = matcher(session[:friend_id], movies_id_arr)
  end

  def preferences
  end 

  def destroy
    movie_counter = 0
    User.where(id: params[:user_id]).update_all(movie_counter: movie_counter, current_genre_deck: "")
    MovieLike.where(user_id: params[:user_id]).destroy_all
    User.where(id: session[:friend_id]).update_all(movie_counter: movie_counter, current_genre_deck: "")
    MovieLike.where(user_id: session[:friend_id]).destroy_all
    redirect_to '/friendships/show'
  end
  # rubocop:enable Metrics/AbcSize

  def like
    MovieLike.create(user_id: params[:user_id], movie_id: params[:movie_id])
    movie_counter = current_user.movie_counter + 1
    User.where(id: params[:user_id]).update_all(movie_counter: movie_counter)
    redirect_to '/games'
  end

  def dislike
    movie_counter = current_user.movie_counter + 1
    User.where(id: params[:user_id]).update_all(movie_counter: movie_counter)
    redirect_to '/games'
  end 

  def mutual_match(user_id, friend_id)
    user_liked_movies = MovieLike.where(user_id: user_id).to_a
                          .map { |movie_like| movie_like.movie_id }
    friend_liked_movies = MovieLike.where(user_id: friend_id).to_a
                          .map { |movie_like| movie_like.movie_id }
    user_liked_movies & friend_liked_movies
  end
end
