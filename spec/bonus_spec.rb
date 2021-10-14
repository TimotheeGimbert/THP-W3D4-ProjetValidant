require_relative '../lib/bonus'

page_jeanluc = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA2150'))


describe 'get_depute_name method' do
  it 'should return a string with at least 1 chars' do
    expect(get_depute_name(page_jeanluc)).to be_a(String)
    expect(get_depute_name(page_jeanluc).length).to be > 1 
  end
  it 'should return "M. Jean-Luc Mélenchon"' do
    expect(get_depute_name(page_jeanluc)).to be == 'M. Jean-Luc Mélenchon'
  end
end

describe 'get_deputes_urls method' do
  it 'should return an array of strings' do
    expect(get_deputes_urls).to be_a(Array)
    expect(get_deputes_urls[0]).to be_a(String)
  end
end