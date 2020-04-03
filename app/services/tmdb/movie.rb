module Tmdb
  class Movie < Base
    attr_accessor :args

    def self.discover
      response = Request.get
      Movie.new(response)
    end

    def initialize(args = {})
      @args = args
      super(@args)
    end

  end
end
