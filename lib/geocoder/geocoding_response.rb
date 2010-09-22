module Geocoder
  class GeocodingResponse < OpenStruct
    
    
  end
end

=begin

def initialize attributes
  attributes.each do |attribute_name, attribute_value| 
    self.class.send :attr_reader, attribute_name
    self.instance_variable_set :"@#{attribute_name}", attribute_value  
  end

  [:response].each do |attribute| 
    raise "#{attribute} not defined" if self.instance_variable_get(:"@#{attribute}").nil?
  end
end

=end