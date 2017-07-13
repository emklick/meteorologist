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
    (raw_data = open(url_url).read
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
    location["lng"])
    
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"].to_s

    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"].to_s

address = "https://api.darksky.net/forecast/b46b4b99659871b539612902438165d6/"

url = address + @latitude + "," + @longitude

open(url).read
    raw_data_forecast = open(url).read
    raw_data_forecast.class
    raw_data_forecast.length
    puts raw_data_forecast
    parsed_data_forecast = JSON.parse(raw_data_forecast)
    parsed_data_forecast.class
    parsed_data_forecast.keys
  


    @current_temperature = parsed_data_forecast.fetch("currently").fetch("temperature")

    @current_summary = parsed_data_forecast.fetch("currently").fetch("summary")

    @summary_of_next_sixty_minutes = parsed_data_forecast.fetch("minutely").fetch("summary")

    @summary_of_next_several_hours = parsed_data_forecast.fetch("hourly").fetch("summary")

    @summary_of_next_several_days = parsed_data_forecast.fetch("daily").fetch("summary")

    render("meteorologist/street_to_weather.html.erb")
  end
end
