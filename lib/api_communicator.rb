require "rest-client"
require "json"
require "pry"
require "pp"

def get_character_movies_from_api(character_name)
  #make the web request

  response_string = RestClient.get("http://swapi.dev/api/people")
  response_hash = JSON.parse(response_string)

  # Get harsh of requested character
  character_hash = response_hash["results"].find { |result| result["name"] == character_name }
  #Find all films featuring this character
  films_urls = character_hash["films"]
  # Make API requests for each url
  film_array = []
  films_urls.each do |film|
    film = RestClient.get("#{film}")
    film_array << JSON.parse(film)
  end

  film_array
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films, character)
  puts "#{character} appears in these movies:"
  # some iteration magic and puts out the movies in a nice list
  films.each { |film| puts film["title"] }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  puts "*" * 30
  print_movies(films, character)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
