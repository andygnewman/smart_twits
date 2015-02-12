require 'sinatra/base'
require_relative 'api_twit'
require_relative 'Wordfrequency'

class SmartTwit < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  
  freq = WordFrequency.new

  get '/' do
    trends = freq.read_file('./data/trends/toptrends.txt')
    @trends_list = trends.map{|el| el[:name]}
    erb :index
  end

  get '/trends/' do
    'hello'
  end
  
  get '/trends?:trend' do
    words_array = freq.read_file("./data/tweets/tweets/#{params[:trend]}_tweets.txt")
    words = words_array.map{|el| el[:text]}
    @words = freq.find_top_results(20, words)

    retwit_array = freq.read_file("./data/tweets/retweeted/#{params[:trend]}_tweets_retweeted.txt")
    @retweet = retwit_array.map{|el| el[:text]}

    followers_array = freq.read_file("./data/tweets/followers/#{params[:trend]}_tweets_followers.txt")
    @followers = followers_array.map{|el| el[:text]}

    erb :trends
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end



