module Utelly
  class Collection < Base
    attr_accessor :args

    def self.get_by_id(id)
      response = UtellyRequest.get_by_id(id)
      Collection.new(response)
    end

    def initialize(args = {})
      @args = args
      super(@args)
    end

  end
end
