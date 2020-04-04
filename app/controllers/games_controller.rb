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
    MovieLike.create(user_id: params[:user_id])
    redirect_to '/games'
  end

end
