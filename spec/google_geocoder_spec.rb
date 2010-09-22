require 'spec_helper.rb'

describe Geocoder::GoogleGeocoder do
  it "should be able to parse a Google geocoding API response" do
    sample_response = %Q{
      {
        "status": "OK",
        "results": [ {
          "types": [ "street_address" ],
          "formatted_address": "1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA",
          "address_components": [ {
            "long_name": "1600",
            "short_name": "1600",
            "types": [ "street_number" ]
          }, {
            "long_name": "Amphitheatre Pkwy",
            "short_name": "Amphitheatre Pkwy",
            "types": [ "route" ]
          }, {
            "long_name": "Mountain View",
            "short_name": "Mountain View",
            "types": [ "locality", "political" ]
          }, {
            "long_name": "California",
            "short_name": "CA",
            "types": [ "administrative_area_level_1", "political" ]
          }, {
            "long_name": "United States",
            "short_name": "US",
            "types": [ "country", "political" ]
          }, {
            "long_name": "94043",
            "short_name": "94043",
            "types": [ "postal_code" ]
          } ],
          "geometry": {
            "location": {
              "lat": 37.4219720,
              "lng": -122.0841430
            },
            "location_type": "ROOFTOP",
            "viewport": {
              "southwest": {
                "lat": 37.4188244,
                "lng": -122.0872906
              },
              "northeast": {
                "lat": 37.4251196,
                "lng": -122.0809954
              }
            }
          }
        } ]
      }
    }
    
    json_sample_response = Crack::JSON.parse(sample_response)
    
    response = Geocoder::GoogleGeocoder.new.parse(json_sample_response)
    response.status.should == "OK"
    
    result = response.results.first
    result.formatted_address.should == "1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA"
    
    expected_point = GeoRuby::SimpleFeatures::Point.from_lon_lat(-122.0841430, 37.4219720)
    result.point.lat.should == expected_point.lat
    result.point.lon.should == expected_point.lon
  end
end