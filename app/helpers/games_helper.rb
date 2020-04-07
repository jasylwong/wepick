module GamesHelper
  def matcher(friend_id, movies_id_arr)
    if mutual_match(current_user.id, friend_id).empty?
      [nil, Movie.find(movies_id_arr[current_user.movie_counter])]
    else
      matched_movie = Movie.find(mutual_match(current_user.id, friend_id)[0])
      ["You Matched with #{friend_email(friend_id)}!", matched_movie]
    end
  end

  def friend_email(friend_id)
    User.find(friend_id).email
  end

  def matched_movie(friend_id)
    Movie.find(mutual_match(current_user.id, friend_id)[0])
  end
  
  def genre_message(friend)
    if friend.current_genre_deck != ""
      "#{friend.email} has chosen #{friend.current_genre_deck}"
    else
      ""
    end
  end 
  
end
