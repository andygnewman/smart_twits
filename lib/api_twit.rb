# require 'rubygems'
require 'twitter'
require 'byebug'
require 'rest-client'
require 'json'
require 'open-uri'

PATH = './credentials.md'
LONDON = 44418

class APITwitter

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
    # byebug
    Twitter::REST::Client.new do |config|
      config.consumer_key        = hash_with_keys["Consumer_Key(API_Key)"]
      config.consumer_secret     = hash_with_keys["Consumer_Secret(API_Secret)"]
      config.access_token        = hash_with_keys["Access_Token"]
      config.access_token_secret = hash_with_keys["Access_Token_Secret"]
    end
  end

  def get_trends(id_g = LONDON)
    @response = @client.trends(id=id_g)
    @response.attrs[:trends].each { |el| @trends << {:name => el[:name],:query => el[:query]}}
    byebug
    @response
  end

  def get_twits(hash_tag_g,query_number = 100)
    twitts = @client.search(hash_tag_g).take(query_number)
    result=[]
    twitts.each do |el|
      result << {:text => el.text, :followers => el.user.followers_count,
                 :user_id => el.user.id, :retweet => el.retweet_count}
    end
    return result
  end

  def getlocation
     html = open('https://twitter.com/trends?id=44418').read
  end

  def merge_twitt(array_of_hash)
    array_of_hash.reduce('') {|sum, el| sum += el[:text]}
  end
  
end