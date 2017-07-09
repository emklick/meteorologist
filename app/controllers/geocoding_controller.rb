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
 
  
  url = "https://maps.googleapis.com/maps/api/geocode/
  json?address= 
  
  ?address=@street_address
  
   http://api.flickr.com/services/rest/
      ?method=maps.googleapis
      &api_key=e0eb58bf4b3e29b253e86d6092e69dee
      &tags=puppies
      &format=json
      &nojsoncallback=1
      &api_sig=200efb63cb01a3d141fff12585e1e20a
  
  
  parsed_data = JSON.parse(open(url).read)


    @latitude = parsed_data["@street_address"][0]["geometry"]["location"]["lat"]

    @longitude = parsed_data["@street_address"][0]["geometry"]["location"]["lng"]

    render("geocoding/street_to_coords.html.erb")
  end
end
