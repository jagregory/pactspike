require 'net/http'
require 'nokogiri'

def get_first_name
  body = Net::HTTP.get URI.parse 'http://localhost:9292'
  xml = Nokogiri::XML.parse body
  xml.at('//first_name').text or raise 'No first name'
end
