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
    expect(twitter.save_trends).not_to eq(nil)
  end

  it "trends should be empty by default" do
    expect(twitter.trends).to be_empty
  end

  it "should be able to have trends" do
    twitter.save_trends
    expect(twitter.trends.size).to eq(10)
    expect(Dir.glob("./data/trends/**/*").count).to eq(1)
  end

  it 'should merge data to string format' do
    hash = [{:text=>'richard'}, {:text=>'andy'}]
    expect(twitter.merge_tweets(hash)).to be_an_instance_of (String)
  end

  it 'should write the string of merged tweets to a text file' do
    expect(twitter.save_tweet_text_per_trend)
    expect(Dir.glob("./data/tweets/tweets/**/*").count).to eq(10)
  end

  it 'should create 10 files' do 
    twitter.save_trends
    twitter.save_tweets_per_trend()
    expect(Dir.glob("./data/tweets/tweets/**/*").count).to eq(10)
  end


  it 'should save 10 files of tweets from users with most followers' do
    twitter.save_trends
    twitter.save_tweets_per_trend()
    twitter.save_tweets_most_followers_per_trend
    expect(Dir.glob("./data/tweets/followers/**/*").count).to eq(10)
  end


  it 'should be able to delete all existing files in a directory' do
    twitter.save_trends
    expect(Dir.glob("./data/trends/**/*").count).to eq(1)
    twitter.delete_files_from_directory('./data/trends/')
    expect(Dir.glob("./data/trends/**/*").count).to eq(0)    
  end

  it 'should be no hashes in trends file name' do
    expect(twitter.trends.select{|el| el.include?('#')}.count).to eq(0)
  end

  it 'should be able to find media news and save it to a file' do 
    twitter.refresh_all_twitter_data
    expect(Dir.glob("./data/tweets/media/**/*").count).to eq(10)
  end

  it 'should load tweets from the user' do 
    expect(twitter.get_tweets_by_user("@BBCSport","sport").count).not_to eq(0)
  end

end  