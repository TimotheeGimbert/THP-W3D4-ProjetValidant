require 'open-uri'
require 'nokogiri'

def get_coins_names(page)
  # returns an ARRAY of names as STRINGS
  names = page.xpath('//tbody//tr/td[3]/div').to_a # stores all nodes as an array
  names.map!(&:text) # overwrites the array by transforming nodeselement into strings
end

def get_coins_prices(page)
  # returns an ARRAY of prices as STRINGS
  prices_array = page.xpath('//tbody//tr/td[5]/div/a').to_a # stores all nodes as an array
  prices_array.map! do |node| # each node is modified
    node.text 
        .delete(',')[1..-1]
        .to_f # transforming into float 
  end
end

def crypto_scraper(page)
  # returns an ARRAY of coins data as HASHES
  tokens = Array.new

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


