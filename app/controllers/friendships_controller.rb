class FriendshipsController < ApplicationController
 
  def new
    @user = current_user
  end

  def create
    @user.friend_request(User.find_by(id: params[:id]))
    # redirect_to some_url
  end

end
