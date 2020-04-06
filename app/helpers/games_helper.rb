module GamesHelper
  def matcher(friend_id, arr)
    if mutual_match(current_user.id, friend_id).empty?
      ["", Movie.find(arr[current_user.movie_counter])]
    else
      ["You Matched", Movie.find(mutual_match(current_user.id, friend_id)[0])]
    end
  end
end
