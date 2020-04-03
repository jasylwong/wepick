require 'faraday'
require 'json'

class Connection
  BASE = 'http://www.omdbapi.com'

  def self.api
    Faraday.new(url: BASE) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.params['apikey'] = ENV['API_KEY']
    end
  end
end
