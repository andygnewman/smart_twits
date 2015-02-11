require 'api_twit'
require 'byebug'


describe 'API' do

  let(:twitter) { APITwitter.new }
  
  it 'should load passwords' do
    hash= twitter.load_passes('./credentials.md')
    expect(hash.size).to eq(4)
  end

  # it 'should initialize the twitter api' do 
  #   expect(twitter.client.consumer_key).not_to eq(nil)
  # end

  # it "should be able to read a trend" do 
  #   expect(twitter.get_trends).not_to eq(nil)
  # end

  # it "should load trends for london" do
  #   expect(twitter.get_trends.location.id).to eq(44418)
  # end  

  # it "should load trends for london" do
  #   expect(twitter.getlocation).not_to eq(nil)
  # end 

  # it "trends should be empty by default" do
  #   expect(twitter.trends).to be_empty
  # end

  # it "should be able to have trends" do
  #   twitter.get_trends
  #   expect(twitter.trends.size).to eq(10)
  # end

  # it 'should be able to search on hash tags' do 
  #   expect(twitter.get_twits('#banana')).not_to eq(nil)   
  # end  

  it 'should give more than 100 twits' do 
    expect(twitter.get_twits('#banana',20).count).to eq(20)
  end



end