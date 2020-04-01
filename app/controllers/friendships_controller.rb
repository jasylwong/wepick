class FriendshipsController < ApplicationController
 
  def new
    @friendship = Friendship.new
    @requesting_user = current_user
  end

  def create
    @requesting_user = current_user
    @receiving_user = User.find_by(email: params[:email])
    
    @requesting_user.friend_request(@receiving_user)
    @requesting_user.accept_request(@receiving_user)

    # redirect_to pick a movie page
  end

  def index
    @users = User.all
  end

end
