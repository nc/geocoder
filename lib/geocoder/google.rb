module Geocoder
  class Google < Base
    include HTTParty
    base_uri 'http://maps.google.com'
    format :json

    def parse_geocode response_body
      location = response_body["results"].first["geometry"]["location"]
      GeoRuby::SimpleFeatures::Point.from_lon_lat(location["lng"].to_f, location["lat"].to_f)
    end
    
    def parse_reverse_geocode response_body
      address_components = response_body["results"].first["address_components"]
      city_name = address_components.select { |component| component["types"].include?("locality") }.first["long_name"]
    end

    def geocode params={}
      response = self.class.get('/maps/api/geocode/json', :query => params)
      parse(response.parsed_response) rescue raise "Geocoder::Google failed to decode #{response}"
    end
    
    def reverse_geocode params={}
      params[:sensor] = false
      lat = params.delete(:lat)
      lon = params.delete(:lon) || params.delete(:lng)
      
      params[:latlng] = "#{lat},#{lon}"
      
      response = self.class.get('http://maps.googleapis.com/maps/api/geocode/json', :query => params)
      parse_reverse_geocode(response) rescue raise "Geocoder::Google failed to decode #{response}"
    end
    
  end
end