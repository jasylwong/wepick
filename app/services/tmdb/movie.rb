module Tmdb
  class Movie < Base
    attr_accessor :title,
                  :poster_path,
                  :imdb_id,
                  :args,
                  :overview

    def self.find(id)
      response = Request.get(id)
      Movie.new(response)
    end

    def initialize(args = {})
      @args = args["movie_results"][0]
      @title = @args["title"]
      @poster_path = @args["poster_path"]
      @overview = @args["overview"]
      super(args)
    end
  end
end
