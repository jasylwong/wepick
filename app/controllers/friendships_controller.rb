class FriendshipsController < ApplicationController

  def new
  end

  def create
    @requesting_user = current_user
    @receiving_user = User.find_by(id: params[:friend])
    unless @requesting_user.friends_with?(@receiving_user)
      @requesting_user.friend_request(@receiving_user)
      @receiving_user.accept_request(@requesting_user)
    end 
    redirect_to '/friendships/show'
  end


  def index
    @users = User.all
  end

  def show
  end
  
end
