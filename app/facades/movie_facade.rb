require 'faraday'
require './app/poros/movie'

class MovieFacade 
  def self.search(title)
    data = MovieService.search_movies(title)
    movies = data[:results][0..19]
  end

  def self.top_rated
    data = MovieService.top_rated
    movies = data[:results][0..19]
  end

  def self.find_movie(movie_id)
    data = MovieService.movie_details(movie_id)

    movie = Movie.new(data[:details], data[:credits], data[:reviews])
  end
end