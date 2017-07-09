require 'open-uri'

class GeocodingController < ApplicationController
  def street_to_coords_form
    # Nothing to do here.
    render("geocoding/street_to_coords_form.html.erb")
  end

  def street_to_coords
    @street_address = params[:user_street_address]

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================
 
  
  url = "https://maps.googleapis.com/maps/api/geocode/json?=" + @street_address.gsub(" ", "+")
  

  raw_data = open(url).read
  parsed_data = JSON.parse(raw_data)


    @latitude = parsed_data.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lat")

    @longitude =  parsed_data.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lng")

    render("geocoding/street_to_coords.html.erb")
  end
end
