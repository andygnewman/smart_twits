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

  xit "should be able to have trends" do
    twitter.get_trends
    expect(twitter.trends.size).to eq(10)
  end

  xit 'should be able to search on hash tags' do 
    expect(twitter.get_tweets('#banana')).not_to eq(nil)   
  end  

  xit 'should give more than 100 twits' do 
    expect(twitter.get_tweets('#banana',100).count).to eq(100)
  end

  xit 'should merge data to string format' do
    hash = [{:text=>'richard'}, {:text=>'andy'}]
    expect(twitter.merge_tweets(hash)).to be_an_instance_of (String)
  end

  xit 'should write the string of merged tweets to a text file' do
    twitter.save_tweet_text('this is a test tweet text', 'testtrend')
    expect(File.exists?('testtrend_text.txt')).to be(true)
    # expect(file content length) to. eq(input string length) 
  end

  xit 'should return x tweets on the trend from the users with most followers' do
    array_of_hashes = []
    file = File.open('#banana_tweets.dat', 'r')
    file.readlines.each do |el| 
      array_of_hashes << eval(el.chomp)
    end
    file.close()
    expect(twitter.top_followers_tweets(array_of_hashes, 5).count).to eq(5)
  end

  xit 'should return x tweets on the trend from the users with most followers' do
    array_of_hashes = []
    file = File.open('#banana_tweets.dat', 'r')
    file.readlines.each do |el| 
      array_of_hashes << eval(el.chomp)
    end
    file.close()
    expect(twitter.top_retweeted_tweets(array_of_hashes, 5).count).to eq(5)
  end

  it 'should create 10 files' do 
    twitter.get_trends
    # expect(twitter).to receive(:save_data).exactly(10).times
    twitter.save_tweets_per_trend()
  end


end