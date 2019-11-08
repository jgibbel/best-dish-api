# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "json"
require "http"
require "optparse"

Restaurant.delete_all

API_KEY = "grYgRzPX6VW3Qw9f1KdhomrHGzdUakGuLp3bMGsTfAaGmp8_UIFI2TTPi5rdHftQkuYG8_RP2t_X7idGG4Q2BIEC9DFdX8eSc9hBCNwF8k3ijGn6lTJ5bH2JNZ3FXXYx"


# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-new-york-city"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 10

def search(term, location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
  
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse
end

nydinner = search("dinner", "New York City")

nydinner["businesses"].each do |rest|
    if Restaurant.all.find_by(name: rest["name"])
    else 
        Restaurant.create({
            name: rest["name"],
            image: rest["image_url"],
            address: rest["location"]["display_address"].join(" "),
            longitude: rest["coordinates"]["longitude"],
            latitude: rest["coordinates"]["latitude"],
            category: rest["categories"][0]["title"],
            borough: rest["location"]["city"]
        })
    end
end