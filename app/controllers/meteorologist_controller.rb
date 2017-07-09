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

    https://api.darksky.net/forecast/[key]/[latitude],[longitude]
 
    url = 'https://api.darksky.net/forecast/[key]/[street_address]'
    [key] = b46b4b99659871b539612902438165d6
    [latitude] = @latitude
    [longitude] = @longitude
    
    [street_address] = @street_address


    @current_temperature = parsed_results["currently"]["temperature"]

    @current_summary = parsed_results["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_results["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_results["hourly"]["summary"]

    @summary_of_next_several_days = parsed_results["daily"]["summary"]

    render("meteorologist/street_to_weather.html.erb")
  end
end
