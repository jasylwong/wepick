class GamesController < ApplicationController

  @@friend = 0

  def new
    @@friend = params[:friend]
    redirect_to '/games'
  end 

  def create
  end

  def index
    @movie = Movie.find(current_user.movie_counter + 1)
    p @@friend
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
