module GamesHelper
  def matcher(friend_id, movies_id_arr)
    if match?(friend_id)
      [nil, Movie.find(movies_id_arr[current_user.movie_counter])]
    else
      matched_movie = Movie.find(mutual_match(current_user.id, friend_id)[0])
      ["You Matched with #{friend_email(friend_id)}!", matched_movie]
    end
  end

  def match?(friend_id)
    mutual_match(current_user.id, friend_id).empty? || number_of_active_players == 1
  end

  def friend_email(friend_id)
    User.find(friend_id).email
  end

  def matched_movie(friend_id)
    Movie.find(mutual_match(current_user.id, friend_id)[0])
  end
  
  def genre_message(friend)
    if friend.current_genre_deck != ""
      "#{friend.email} has chosen #{friend.current_genre_deck}, Please pick the same category"
    else
      ""
    end
  end 
  
  def number_of_active_players
    all_movie_likes = MovieLike.all.to_a
    active_player_ids = all_movie_likes.map { |movielike| movielike.user_id }.uniq
    active_player_ids.count
  end
end
