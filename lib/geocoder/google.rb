module Geocoder
  class Google < Base
    include HTTParty
    base_uri 'http://maps.google.com'
    format :json

    def parse response_body
      location = response_body["results"].first["geometry"]["location"]
      GeoRuby::SimpleFeatures::Point.from_lon_lat(location["lng"].to_f, location["lat"].to_f)
    end

    def geocode params={}
      response = self.class.get('/maps/api/geocode/json', :query => params)
      parse(response.parsed_response)
    end
    
  end
end