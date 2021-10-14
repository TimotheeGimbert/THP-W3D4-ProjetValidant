require 'open-uri'
require 'nokogiri'

def get_city_name(city_url) # returns a name as a STRING
  page = Nokogiri::HTML(URI.open(city_url))
  city_name = page.xpath('/html/body/div/main/section[1]/div/div/div/h1').text
  city_name = city_name[0..-9]
  print city_name + " => "
  return city_name
end

def get_city_email(city_url) # returns an email as a STRING
  page = Nokogiri::HTML(URI.open(city_url))
  city_email = page.xpath('//main/section[2]//tbody/tr[4]/td[2]').text
  puts city_email
  return city_email
end

def get_dpt_urls(dpt_url) # returns an ARRAY of urls as STRINGS
  page = Nokogiri::HTML(URI.open(dpt_url))
  dpt_urlS = page.xpath('//a[contains(@href, "./")]/@href').to_a
  dpt_urlS.map! {|url| url.to_s[1..-1].prepend('https://www.annuaire-des-mairies.com')}
  return dpt_urlS
end

def scrap_dpt_emails(urls_array) # return an ARRAY of HASHES
  data_array = Array.new
  urls_array.each {|url| 
    city_name = get_city_name(url)
    city_email = get_city_email(url)
    data_array.push( { city_name => city_email } )  
  }
  return data_array 
end


def perform
  url_95 = 'https://www.annuaire-des-mairies.com/val-d-oise.html'
  urls_array = get_dpt_urls(url_95)
  scrap_dpt_emails(urls_array)
end

perform
