class MoviesController < ApplicationController
  def index
    @movies = Tmdb::Movie.discover
  end
end