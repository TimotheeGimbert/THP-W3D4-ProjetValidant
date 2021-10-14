require_relative '../lib/dark_trader.rb'

page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
 
describe "get_coins_names method" do
  it "should return an array of strings" do
    expect(get_coins_names(page)).to be_a(Array)
    expect(get_coins_names(page)[0]).to be_a(String)
    expect(get_coins_names(page)[0]).to be == "BTC"
  end
end

describe "get_coins_prices method" do
  it "should return an array of floats" do
    expect(get_coins_prices(page)).to be_a(Array)
    expect(get_coins_prices(page)[0]).to be_a(Float)
  end
end

describe "crypto_scraper method" do
  it "should return an array of hashes" do
    expect(crypto_scraper(page)).to be_a(Array)
    expect(crypto_scraper(page)[0]).to be_a(Hash)
  end
end


