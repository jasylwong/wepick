class GamesController < ApplicationController

  @@friend = 0

  def new
    @@friend_id = params[:friend_id]
    redirect_to '/games'
  end 

  def create
  end

  def index
    @movie = Movie.find(current_user.movie_counter + 1)
    
    user_one_likes = !!MovieLike.find_by(user_id: current_user.id, movie_id: @movie.id - 1)
    user_two_likes = !!MovieLike.find_by(user_id: @@friend_id, movie_id: @movie.id - 1)

    if user_one_likes && user_two_likes 
      @match = "You Matched"
    else
      @match = "" 
    end
  end

  def show
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
end
