require 'open-uri'
require 'nokogiri'

def crypto_scrapper(page)
  
  coins_nodeset = page.xpath('//tbody//tr/td[3]/div') # get the coins's names nodeset 
  prices_nodeset = page.xpath('//tbody//tr/td[5]/div/a') # get the coins's prices nodeset

  coinS = Array.new # array that will hold coins's names
  coins_nodeset.each {|div| coinS.push(div.text)}

  priceS = Array.new # array that will hold coins'prices
  prices_nodeset.each {|a| priceS.push(a.text[1..-1])} # removes the $ sign by selecting char 1..-1
  
  tokens = Array.new # array that will hold final data
  coinS.length.times do |i|
    coin_hash = { coinS[i] => priceS[i]}
    tokens.push(coin_hash)
  end
  
  puts tokens
end

def perform
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  crypto_scrapper(page)
end

perform


