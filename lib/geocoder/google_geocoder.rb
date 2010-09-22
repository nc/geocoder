module Geocoder
  class GoogleGeocoder < Base
    include HTTParty
    base_uri 'http://maps.google.com'
    format :json

    def parse response_body
      results = response_body["results"]  
      results.map! do |result|
        location = result["geometry"]["location"]
        GeocodingResult.new(:formatted_address => result["formatted_address"],
                            :point => GeoRuby::SimpleFeatures::Point.from_lon_lat(location["lng"].to_f, location["lat"].to_f))
      end
      
      response = GeocodingResponse.new(:status => response_body["status"], :results => results)
    end

    def geocode params={}
      response = self.class.get('/maps/api/geocode/json', :query => params)
      parse(response.parsed_response)
    end
    
  end
end