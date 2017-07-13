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

require 'open-uri'
require 'json'

url = "https://maps.googleapis.com/maps/api/geocode/json?address="

url_url = url + @street_address.gsub(" ", "+")

open(url_url).read
    raw_data = open(url_url).read
    # raw_data.class
    # raw_data.length
    # puts raw_data
    parsed_data = JSON.parse(raw_data)
    # parsed_data.class
    # parsed_data.keys
    # results = parsed_data["results"]
    # results.class
    # results.length
    # first = results[0]
    # first.class
    # first.keys
    # geometry = first["geometry"]
    # geometry.class
    # geometry.keys
    # location = geometry["location"]
    # location["lat"]
    # location["lng"]



    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    render("geocoding/street_to_coords.html.erb")
  end
end
