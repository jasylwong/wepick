class GamesController < ApplicationController

  def new
  end 

  def create
  end

  def index
    @testmovie = Movie.find(1)
  end

  def show
  end 

  def like
    MovieLike.create(user_id: params[:user_id])
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
