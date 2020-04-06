module GamesHelper
  def matcher(friend_id, movies_id_arr)
    if mutual_match(current_user.id, friend_id).empty?
      ["", Movie.find(movies_id_arr[current_user.movie_counter])]
    else
      ["You Matched", Movie.find(mutual_match(current_user.id, friend_id)[0])]
    end
  end
end
