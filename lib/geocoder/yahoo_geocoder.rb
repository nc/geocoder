module Geocoder
  class YahooGeocoder < Geocoder::Base
    include HTTParty
    base_uri 'http://where.yahooapis.com'
    default_params :appid => "TENIydrV34FysB52jX0u6FIpeNqVt5wrYIEwpYafQC4J270ingCnjJQhi0.I7INq6pgXeH69P2N6DAPb9w--"
    format :xml
    
    sample_response = %Q{
      <?xml version="1.0" encoding="UTF-8"?>
      <ResultSet version="1.0">
      <Error>0</Error>
      <ErrorMessage>No error</ErrorMessage>
      <Locale>us_US</Locale>
      <Quality>87</Quality>
      <Found>1</Found>
      <Result>
        <quality>85</quality>
        <latitude>38.898717</latitude>
        <longitude>-77.035974</longitude>
        <offsetlat>38.898590</offsetlat>
        <offsetlon>-77.035971</offsetlon>
        <radius>500</radius>
        <name></name>
        <line1>1600 Pennsylvania Ave NW</line1>
        <line2>Washington, DC  20006</line2>
        <line3></line3>
        <line4>United States</line4>
        <house>1600</house>
        <street>Pennsylvania Ave NW</street>
        <xstreet></xstreet>
        <unittype></unittype>
        <unit></unit>
        <postal>20006</postal>
        <neighborhood></neighborhood>
        <city>Washington</city>
        <county>District of Columbia</county>
        <state>District of Columbia</state>
        <country>United States</country>
        <countrycode>US</countrycode>
        <statecode>DC</statecode>
        <countycode>DC</countycode>
        <uzip>20006</uzip>
        <hash>B42121631CCA2B89</hash>
        <woeid>12765843</woeid>
        <woetype>11</woetype>
      </Result>
      </ResultSet>
    }
    
    def parse response_body
      status = "OK" # todo nc add error handling
      result = response_body["ResultSet"]["Result"]
      puts response_body.inspect
      
      result = GeocodingResult.new(:point => GeoRuby::SimpleFeatures::Point.from_lon_lat(result["longitude"].to_f, result["latitude"].to_f), 
                                   :formatted_address => ("#{result["line1"]}, #{result["line2"]}, #{result["countrycode"]}"))
      response = GeocodingResponse.new(:results => [result], :status => status)
    end
    
    def geocode params={}
      response = self.class.get('/geocode', :query => { :q => params[:address] })
      parse(parsed_response)
    end
    
  end
end