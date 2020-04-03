class MoviesController < ApplicationController
  def index
    @movie, @error = Tmdb::Movie.find(params[:id])
    @poster = "http://image.tmdb.org/t/p/w185" + @movie.poster_path
  end
end
