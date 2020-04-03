class MoviesController < ApplicationController
  def index
    @movie = Tmdb::Movie.find(params[:id])
    @error = Tmdb::Movie.find(params[:id])
    @poster = "http://image.tmdb.org/t/p/w185" + "#{@movie.poster_path}"
    p "************************************"
    p @movie
    p "************************************"
  end
end
