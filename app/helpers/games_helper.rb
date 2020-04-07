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
     !(mutual_match(current_user.id, friend_id).empty?) 
  end

  def friend_email(friend_id)
    User.find(friend_id).email
  end

  def genre_message(friend)
    if friend.current_genre_deck != ""
      "#{friend.email} has chosen #{friend.current_genre_deck}, Please pick the same category"
    else
      ""
    end
  end 
end
