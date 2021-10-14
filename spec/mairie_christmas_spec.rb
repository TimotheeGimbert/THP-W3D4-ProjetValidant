require_relative '../lib/mairie_christmas'

url = 'https://www.annuaire-des-mairies.com/95/ambleville.html'
url_95 = 'https://www.annuaire-des-mairies.com/val-d-oise.html'

describe 'get_city_name method' do
  it 'should return a string with at least 2 chars' do
    expect(get_city_name(url)).to be_a(String)
    expect(get_city_name(url).length).to be > 2
  end
  it 'should return AMBLEVILLE' do
    expect(get_city_name(url)).to be == 'AMBLEVILLE'
  end
end

describe 'get_city_email method' do
  it 'should return a string with at least 6 chars' do
    expect(get_city_email(url)).to be_a(String)
    expect(get_city_email(url).length).to be > 4
  end
end

describe 'scrap_dpt_emails' do
  it 'should return and array of hashes' do
    expect(scrap_dpt_emails([url])).to be_a(Array)
    expect(scrap_dpt_emails([url])[0]).to be_a(Hash)
  end
end