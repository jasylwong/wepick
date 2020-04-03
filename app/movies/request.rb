class Request
  class << self
    def get
      response, status = get_json("3/discover/movie", {})
      status == 200 ? response : errors(response)
    end

    def errors(response)
      error = { errors: { status: response["status"], message: response["message"] } }
      response.merge(error)
    end

    def get_json(root_path, query = {})
      query_string = query.map { |k, v| "#{k}=#{v}" }.join("&")
      path = query.empty? ? root_path : "#{root_path}?#{query_string}"
      response = api.get(path)

      [JSON.parse(response.body), response.status]
    end

    def api
      Connection.api
    end
  end
end
