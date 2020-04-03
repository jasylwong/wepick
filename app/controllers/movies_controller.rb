class MoviesController < ApplicationController
  def index
    @movie = Tmdb::Movie.find("tt0137523")
    @poster = "http://image.tmdb.org/t/p/w185" + "#{@movie.poster_path}"
  end
end
