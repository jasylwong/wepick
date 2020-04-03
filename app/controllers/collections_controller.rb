class CollectionsController < ApplicationController
  
  # def index
  #   @collections = Tmdb::Collection.discover
  # end

  def show
    @collection = Tmdb::Collection.discover
  end 
end
