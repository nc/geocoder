gem 'httparty'
gem 'crack'

require 'httparty'
require 'geo_ruby'
require 'ostruct'
require 'crack'

Dir["#{File.dirname(__FILE__)}/geocoder/*"].each { |file| require file }