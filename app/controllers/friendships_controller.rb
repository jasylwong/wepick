class FriendshipsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @user = current_user
  end

  def create
    @user.friend_request(User.find_by(id: params[:id]))
    # redirect_to some_url
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
