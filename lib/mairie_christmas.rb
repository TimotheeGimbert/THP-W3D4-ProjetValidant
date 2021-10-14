require 'open-uri'
require 'nokogiri'

def get_city_email(city_url)
  page = Nokogiri::HTML(URI.open(city_url))
  email_node = page.xpath('//main/section[2]//tbody/tr[4]/td[2]/text()')
  puts email_node
end

get_city_email('https://www.annuaire-des-mairies.com/95/avernes.html')