class FriendshipsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.create(friendship_params)
    # redirect_to some_url
  end

  def edit
  end

  def update
  end

  def destroy 
  end

end


