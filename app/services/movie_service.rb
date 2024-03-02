class MovieService
  def self.conn
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
    end
  end

  def self.search_movies(title)
    query_conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
      faraday.params["query"] = title
    end
    response = query_conn.get("/3/search/movie")

    data = JSON.parse(response.body, symbolize_names: true)
  end
end