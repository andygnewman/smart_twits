require 'sinatra/base'
require 'httparty'
require 'json'
require_relative 'api_twit'
require_relative 'Wordfrequency'

class SmartTwit < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  
  get '/' do
    file = File.open('./data/trends/toptrends.txt','r')
    array = []
    file.readlines.each do |el| 
      array << eval(el.chomp)
    end
    file.close()
    @trends_list = array.map{|el| el[:name]}.compact
    erb :index
  end

  get '/trends/' do
    'hello'
  end
  
  get '/trends?:trend' do
    'hi I am here'
    freq = WordFrequency.new
    file = File.open("./data/tweets/#{params[:trend]}_tweets.txt",'r')
    array = []
    file.readlines.each do |el| 
      array << eval(el.chomp)
    end
    file.close()
    words = array.map{|el| el[:text]}
    @words = freq.find_top_results(20, words)
    erb :trends
  end


  
  # start the server if ruby file executed directly
  run! if app_file == $0
end

file = File.open("./data/tweets/Eurovision_tweets.txt",'r')
    array = []
    file.readlines.each do |el| 
      array << eval(el.chomp)
    end
    file.close()
    words = array.map{|el| el[:text]}



