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

   url = "https://api.darksky.net/forecast/" + key + / + latitude,longitude
 
    key = b46b4b99659871b539612902438165d6
    latitude = @lat
    longitude = @lng
  

    raw_data = open(url).read
    parsed_results = JSON.parse(raw_data)

    @current_temperature = parsed_results.fetch("currently").fetch("temperature")

    @current_summary = parsed_results.fetch("currently").fetch("summary")

    @summary_of_next_sixty_minutes = parsed_results.fetch("minutely").fetch("summary")

    @summary_of_next_several_hours = parsed_results.fetch("hourly").fetch("summary")

    @summary_of_next_several_days = parsed_results.fetch("daily").fetch("summary")

    render("forecast/coords_to_weather.html.erb")
  end
end
