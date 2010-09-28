require 'spec_helper.rb'

describe Geocoder::Yahoo do
  it "should be able to parse a Yahoo geocoding API response" do
    
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

    point = Geocoder::Yahoo.new.parse(Crack::XML.parse(sample_response))
    expected_point = GeoRuby::SimpleFeatures::Point.from_lon_lat(-77.035974, 38.898717)
    point.lat.should == expected_point.lat
    point.lon.should == expected_point.lon
  end
end