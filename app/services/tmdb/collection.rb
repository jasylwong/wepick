module Tmdb
  class Collection < Base
    attr_accessor :args

    def self.discover
      response = Request.get
      Collection.new(response)
    end

    def self.find_by_id(id)
      Request.get_by_id(id)
    end

    def initialize(args = {})
      @args = args
      super(@args)
    end

  end
end
