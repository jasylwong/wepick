class GamesController < ApplicationController

  def new
  end 

  def create
  end

  def index
  end

  def show
  end 

  def like
    movie_counter = User.find(params[:user_id]).movie_counter + 1
    MovieLike.create(user_id: params[:user_id])
    User.where(id: params[:user_id]).update_all(movie_counter: movie_counter)
    redirect_to '/games'
  end

end
