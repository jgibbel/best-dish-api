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

Dish.delete_all
Restaurant.delete_all


API_KEY = ENV["YELP_API_KEY"]

# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-new-york-city"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 50

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

nydinner = search("", "New York City")

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

Restaurant.all.each do |rest| 
    3.times do 
        Dish.create({restaurant_id: rest.id, name: Faker::Food.dish})
    end 
end 