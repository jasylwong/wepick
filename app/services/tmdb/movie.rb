module Tmdb
  class Movie < Base
    attr_accessor :title,
                  :poster_path,
                  :imdb_id

    def self.find(id)
      response = Request.get({ external_id: id })
      Movie.new(response)
    end

    def initialize(args = {})
      super(args)
    end
  end
end
