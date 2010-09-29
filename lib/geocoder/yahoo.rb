module Geocoder
  class Yahoo < Geocoder::Base
    include HTTParty
    base_uri 'http://where.yahooapis.com'
    default_params :appid => "TENIydrV34FysB52jX0u6FIpeNqVt5wrYIEwpYafQC4J270ingCnjJQhi0.I7INq6pgXeH69P2N6DAPb9w--"
    format :xml
    
    def parse response_body
      result = response_body["ResultSet"]["Result"]
      GeoRuby::SimpleFeatures::Point.from_lon_lat(result["longitude"].to_f, result["latitude"].to_f)
    end
    
    def geocode params={}
      response = self.class.get('/geocode', :query => { :q => params[:address] })
      parse(response) rescue raise "Geocoder::Google failed to decode #{response}"
    end
    
  end
end