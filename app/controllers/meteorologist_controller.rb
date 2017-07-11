require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("meteorologist/street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================


require 'open-uri'
require 'json'

url = "https://maps.googleapis.com/maps/api/geocode/json?address="



url_url = url + @street_address.gsub(" ", "+")

open(url_url).read
    raw_data = open(url_url).read
    raw_data.class
    raw_data.length
    puts raw_data
    parsed_data = JSON.parse(raw_data)
    parsed_data.class
    parsed_data.keys
    results = parsed_data["results"]
    results.class
    results.length
    first = results[0]
    first.class
    first.keys
    geometry = first["geometry"]
    geometry.class
    geometry.keys
    location = geometry["location"]
    location["lat"]
    location["lng"]

    @lat = parsed_data["results"][0]["geometry"]["location"]["lat"]

    @lng = parsed_data["results"][0]["geometry"]["location"]["lng"]
    

require 'open-uri'
require 'json'

address = "https://api.darksky.net/forecast/b46b4b99659871b539612902438165d6/"

url = address + @lat + "," + @lng

  open(url).read
    raw_data = open(url).read
    raw_data.class
    raw_data.length
    puts raw_data
    parsed_data = JSON.parse(raw_data)
    parsed_data.class
    parsed_data.keys
  


    @current_temperature = parsed_data.fetch("currently").fetch("temperature")

    @current_summary = parsed_data.fetch("currently").fetch("summary")

    @summary_of_next_sixty_minutes = parsed_data.fetch("minutely").fetch("summary")

    @summary_of_next_several_hours = parsed_data.fetch("hourly").fetch("summary")

    @summary_of_next_several_days = parsed_data.fetch("daily").fetch("summary")

    render("meteorologist/street_to_weather.html.erb")
  end
end
