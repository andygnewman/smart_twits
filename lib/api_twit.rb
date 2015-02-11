# require 'rubygems'
require 'twitter'
require 'byebug'
require 'rest-client'
require 'json'
require 'open-uri'
require 'json'
require './app/helpers/twitter_helpers'

PATH = './credentials.md'
LONDON = 44418
PATH_TRENDS = './data/trends/'
PATH_TWEETS = './data/tweets/'
PATH_TWEETS_TEXT = './data/tweets/text/'
PATH_TWEETS_FOLLOWERS = './data/tweets/followers/'
PATH_TWEETS_RETWEETED = './data/tweets/retweeted/'

class APITwitter

  include Twitter_Helpers

  attr_reader :client, :trends

  def initialize
    hash_with_passes = load_passes
    @client = init_twit(hash_with_passes)
    @trends = []
  end

  def load_passes(path = PATH)
    return Hash[*File.read(path).split(/[: \n]+/)]
  end

  def init_twit(hash_with_keys)
    Twitter::REST::Client.new do |config|
      config.consumer_key        = hash_with_keys["Consumer_Key(API_Key)"]
      config.consumer_secret     = hash_with_keys["Consumer_Secret(API_Secret)"]
      config.access_token        = hash_with_keys["Access_Token"]
      config.access_token_secret = hash_with_keys["Access_Token_Secret"]
    end
  end

  # def save_data(filename,item)
  #   file = File.open(filename, 'w')
  #   file.puts item.to_json
  #   file.close()  
  # end

  def get_trends(id_g = LONDON)
    @response = @client.trends(id=id_g)
    @response.attrs[:trends].each { |el| @trends << {:name => el[:name],:query => el[:query]}}
    json_trends = {toptrends: @trends}
    save_data(PATH_TRENDS+'toptrends.json', json_trends) #maybe @trends does not need to be
    @response                          #instance ver. 
  end

  def save_tweets_per_trend(query_number = 100,trends = @trends)
    trends.each do |trend| 
      tweets = get_tweets(trend[:query],query_number)
      save_data(PATH_TWEETS+trend[:name]+'_tweets.json',tweets)
    end
  end

  def get_tweets(hash_tag_g,query_number = 10)
    tweets = @client.search(hash_tag_g).take(query_number)
    result=[]
    tweets.each do |el|
      result << {:text => el.text, :followers => el.user.followers_count,
                 :user_id => el.user.id, :retweet => el.retweet_count}
    end
    return result
  end

  def merge_tweets(array_of_hash)
    array_of_hash.reduce('') {|sum, el| sum += el[:text]}
  end 

  def top_followers_tweets(array_of_hashes, number = 5)
    array_of_hashes.sort { |x, y| x[:followers] <=> y[:followers] }.reverse[0..(number-1)]
  end

  def top_retweeted_tweets(array_of_hashes, number = 5)
    array_of_hashes.sort { |x, y| x[:retweet] <=> y[:retweet] }.reverse[0..(number-1)]
  end

  # def get_tweet_from_file (filename)
  #   array_of_hashes = []
  #   file = File.open(filename, 'r')
  #   file.readlines.each do |el| 
  #     array_of_hashes << eval(el.chomp)
  #   end
  #   file.close()
  #   return array_of_hashes
  # end

  def save_tweet_text_per_trend(trends = @trends)
    trends.each do |trend| 
      tweets = get_tweet_from_file(PATH_TWEETS+trend[:name]+'_tweets.json')
      tweet_text = merge_tweets(tweets)
      save_data(PATH_TWEETS_TEXT+trend[:name]+'_tweets_text.json', tweet_text)
    end
  end

  def save_tweets_most_followers_per_trend(trends = @trends)
    trends.each do |trend| 
      tweets = get_tweet_from_file(PATH_TWEETS+trend[:name]+'_tweets.json')
      tweets_most_followers = top_followers_tweets(tweets)
      save_data(PATH_TWEETS_FOLLOWERS+trend[:name]+'_tweets_followers.json', tweets_most_followers)
    end
  end  

  def save_tweets_most_retweeted_per_trend(trends = @trends)
    trends.each do |trend| 
      tweets = get_tweet_from_file(PATH_TWEETS+trend[:name]+'_tweets.json')
      tweets_most_retweeted = top_retweeted_tweets(tweets)
      save_data(PATH_TWEETS_RETWEETED+trend[:name]+'_tweets_retweeted.json', tweets_most_retweeted)
    end
  end  

  def delete_files_from_directory(dirname)
    FileUtils.rm Dir.glob("#{dirname}/*")
  end

   def getlocation
     html = open('https://twitter.com/trends?id=44418').read
  end

end




