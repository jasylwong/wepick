require 'faraday'
require 'json'

class UtellyConnection
  BASE = 'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com'

  def self.api
    Faraday.new(url: BASE) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['X-RapidAPI-Key'] = ENV['UTELLY_KEY']
      faraday.params['country'] = 'UK'
      faraday.params['source'] = 'imdb'
    end
  end
end
