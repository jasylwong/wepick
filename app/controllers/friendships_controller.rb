class FriendshipsController < ApplicationController

  def new
    @friendship = Friendships.new
  end

  def create
    @requesting_user = current_user
    @receiving_user = User.find_by(id: params[:friend])
    @requesting_user.friend_request(@receiving_user)
    @receiving_user.accept_request(@requesting_user)
    redirect_to '/friendships/show'
  end

  def index
    @users = User.all
  end

  def show
  end
  
end
