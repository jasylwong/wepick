require 'faraday'
require 'json'

class Connection
  BASE = 'https://api.themoviedb.org'

  def self.api
    Faraday.new(url: BASE) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.params['api_key'] = ENV['TMDB_KEY']
    end
  end
end
