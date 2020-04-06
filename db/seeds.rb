# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genre_list = {  28 => "Action", 12 => "Adventure", 16 => "Animation", 35 => "Comedy",
                80 => "Crime", 99 => "Documentary", 18 => "Drama", 10751 => "Family",
                14 => "Fantasy", 36 => "History", 27 => "Horror", 10402 => "Music", 
                9648 => "Mystery", 10749 => "Romance", 878 => "Science Fiction", 
                10770 => "TV Movie", 53 => "Thriller", 10752 => "War", 37 => "Western" }

page = 1                
30.times do
  collection = Tmdb::Collection.discover(page).args["results"]
  collection.each do |movie|
    # Some movies have >1 genre. Have kept as an array in the tables so can still be manipulated easily.
    genres = movie["genre_ids"].map { |genre_id| genre_list[genre_id] }
    # making a external request to find imdb id 
    movie['imdb_id'] = Tmdb::Collection.get_by_id(movie["id"])["imdb_id"]
    Movie.create(title: movie["title"], overview: movie["overview"], imdb_id: movie["imdb_id"], poster_path: movie["poster_path"], genre: genres)
  end
  page += 1
end
