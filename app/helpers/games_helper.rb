module GamesHelper
  def matcher(friend_id, movies_id_arr)
    if match?(friend_id)
      matched_movie = Movie.find(mutual_match(current_user.id, friend_id)[0])
      ["You Matched with #{friend_email(friend_id)}!", matched_movie]
    else
      [nil, Movie.find(movies_id_arr[current_user.movie_counter])]
    end
  end

  def match?(friend_id)
    if mutual_match(current_user.id, friend_id).empty? # || current_user.id == friend_id
      false
    else 
      true
    end 
  end

  def friend_email(friend_id)
    User.find(friend_id).email
  end

end
