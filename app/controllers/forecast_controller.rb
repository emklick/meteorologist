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

   url = https://api.darksky.net/forecast/[key]/[latitude],[longitude]
 
    [key] = b46b4b99659871b539612902438165d6
    [latitude] = @lat
    [longitude] = @lng
    
  

    @current_temperature = parsed_results["currently"]["temperature"]

    @current_summary = parsed_results["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_results["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_results["hourly"]["summary"]

    @summary_of_next_several_days = parsed_results["daily"]["summary"]

    render("forecast/coords_to_weather.html.erb")
  end
end
