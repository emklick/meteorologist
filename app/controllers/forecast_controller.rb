require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

require 'open-uri'
require 'json'

address = "https://api.darksky.net/forecast/b46b4b99659871b539612902438165d6/"


url = address + @lat + , + @lng


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

    render("forecast/coords_to_weather.html.erb")
  end
end
