class GamesController < ApplicationController

  def new
    @@friend_id = params[:friend_id]
    redirect_to '/games/preferences'
  end 

  def create
  end

  def index
    session[:genre] = params[:genre] unless params[:genre] == nil
    movies_by_genre = Movie.where('genre LIKE ?', "%#{session[:genre]}%").to_a
    movies_id_arr = movies_by_genre.map do |movie|
      movie.id
    end
    @movie = Movie.find(movies_id_arr[current_user.movie_counter])

    # @movie = Movie.find(current_user.movie_counter + 1)
    # user_one_likes = find_likes(current_user.id, @movie.id)
    # user_two_likes = find_likes(@@friend_id, @movie.id)
    # print_match(user_one_likes, user_two_likes)
  end

  def preferences

  end 

  def destroy
    movie_counter = 0
    User.where(id: params[:user_id]).update_all(movie_counter: movie_counter)
    MovieLike.where(user_id: params[:user_id]).destroy_all
    User.where(id: @@friend_id).update_all(movie_counter: movie_counter)
    MovieLike.where(user_id: @@friend_id).destroy_all
    redirect_to '/friendships/show'
  end

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

  def print_match(user_one_likes, user_two_likes)
    if user_one_likes && user_two_likes 
      @match = "You Matched"
    else
      @match = "" 
    end
  end 

  def find_likes(user, movie)
    !!MovieLike.find_by(user_id: user, movie_id: movie - 1)
  end
end
