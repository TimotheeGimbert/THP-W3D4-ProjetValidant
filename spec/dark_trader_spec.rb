require_relative '../lib/dark_trader.rb'

describe "perform method" do
  it "should return an array" do
    expect(perform).to be_a(Array)
  end
  it "should return an array of hashes" do
    expect(perform[0]).to be_a(Hash)
  end
  it "should return an array of at least 15 coins" do
    perform().length.should >= 15
  end
end