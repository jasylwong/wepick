class FriendshipsController < ApplicationController
 
  def new
    @friendship = Friendships.new
  end

  def create
    @requesting_user = current_user
    @receiving_user = User.find_by(email: params[:email])
    
    @requesting_user.friend_request(@receiving_user)
    @requesting_user.accept_request(@receiving_user)

    redirect_to '/friendships/index'
  end

  def index
    @users = User.all
  end

end
