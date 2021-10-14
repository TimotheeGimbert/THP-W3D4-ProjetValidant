require 'open-uri'
require 'nokogiri'

def get_depute_info(url) # returns a hash { "first_name" => "Jean", "last_name" ... }
  depute_page = Nokogiri::HTML(URI.open(url))
  name = get_depute_name(depute_page) 
  email = get_depute_email(depute_page)
end

def get_depute_name(depute_page)
  name = depute_page.xpath('//article/div[2]/h1').text
  puts name
  return name
end

def get_depute_email(depute_page)
  email = depute_page.xpath('//*[@class="deputes-liste-attributs"]/dd[4]//li[2]/a').text
  puts email
end

def get_deputes_urls() # returns an ARRAY of urls to scrap
  page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  urls = page.xpath('//div[@id="deputes-list"]//li//a/@href').to_a
  urls.map! {|url| url.to_s.prepend('https://www2.assemblee-nationale.fr')}
  return urls 
end


def perform
  a = Array.new
  deputes_urls = get_deputes_urls() # we generate an array with the depute's pages urls
  deputes_urls.each { |url| a.push(get_depute_info(url)) }
  puts a
end

perform
