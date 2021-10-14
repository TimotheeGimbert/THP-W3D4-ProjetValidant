require 'open-uri'
require 'nokogiri'

def get_coins_names(page) # returns an ARRAY of names as STRINGS
  names = page.xpath('//tbody//tr/td[3]/div').to_a
  names.map! {|node| node.text}
  return names
end

def get_coins_prices(page) # returns an ARRAY of prices as STRINGS
  prices_array = page.xpath('//tbody//tr/td[5]/div/a').to_a
  prices_array.map! {|node| node = node.text.delete(",")[1..-1].to_f} # makes nodes as astring and remove $ sign
  return prices_array
end


def crypto_scraper(page) # returns an ARRAY of coins data as HASHES
  tokens = Array.new # array that will hold final data

  names_array = get_coins_names(page)
  prices_array = get_coins_prices(page)
  
  names_array.length.times do |i|
    coin_hash = { names_array[i] => prices_array[i] }
    tokens.push(coin_hash)
  end

  return tokens
end

def perform
  system('clear')
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  puts crypto_scraper(page)
end

perform


