require 'sinatra/base'
require_relative 'api_twit'
require_relative 'tweets'

class SmartTwit < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  
  tweets = Tweets.new

  get '/' do
    trends = tweets.read_file('./data/trends/toptrends.txt')
    @trends_list = []
    trends.map{|el| @trends_list << [el[:name], el[:filename]]}
    erb :trends
  end
  
  get '/trends?:trend' do
    words_array = tweets.read_file("./data/tweets/tweets/#{params[:trend]}_tweets.txt")
    words = words_array.map{|el| el[:text]}
    @words = tweets.find_top_words(20, words)

    retwit_array = tweets.read_file("./data/tweets/retweeted/#{params[:trend]}_tweets_retweeted.txt")
    @retweets = []
    retwit_array.map{|el| @retweets << [el[:text], el[:retweet]]}

    followers_array = tweets.read_file("./data/tweets/followers/London_tweets_followers.txt")
    @followers = []
    followers_array.map{|el| @followers << [el[:name], el[:text], el[:followers]]}

    @mentions = tweets.find_top_mentions(5, "./data/tweets/tweets/#{params[:trend]}_tweets.txt")

    erb :words
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end



