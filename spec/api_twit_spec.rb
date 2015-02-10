require 'api_twit'
require 'byebug'


describe 'API' do

  let(:twitter) { APITwitter.new }
  
  it 'should load passwords' do
    hash= twitter.load_passes('./credentials.md')
    expect(hash.size).to eq(4)
  end

  it 'should initialize the twitter api' do 
    expect(twitter.client.consumer_key).not_to eq(nil)
  end

  it "should be able to read a trend" do 
    expect(twitter.get_trends).not_to eq(nil)
  end

  it "should load trends for london" do
    expect(twitter.get_trends.location.id).to eq(44418)
  end  

  it "should load trends for london" do
    expect(twitter.getlocation).not_to eq(nil)
  end  

end