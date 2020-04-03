class MoviesController < ApplicationController
  def index
    @movie, @error = Omdb::Movie.find(params[:id])
  end
end
