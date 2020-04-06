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
    user_one_likes = find_likes(current_user.id, @movie.id)
    user_two_likes = find_likes(@@friend_id, @movie.id)
    print_match(user_one_likes, user_two_likes)
  end

  def show
  end 

  def destroy
    movie_counter = current_user.movie_counter = 0
    # Reset movie counter and likes for current user
    User.where(id: params[:user_id]).update_all(movie_counter: movie_counter)
    MovieLike.where(user_id: params[:user_id]).destroy_all
    # Rest movie counter and likes for opponent
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
