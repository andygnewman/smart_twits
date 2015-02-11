require 'sinatra/base'
require_relative 'api_twit'
require_relative 'Wordfrequency'

class SmartTwit < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  
  get '/' do
    twit = APITwitter.new
    file = File.open('./data/trends/toptrends.txt','r')
    array = []
    file.readlines.each do |el| 
      array << eval(el.chomp)
    end
    file.close()
    @trends_list = array.map{|el| el[:name]}.compact
    erb :trends
  end
  
  get '/:trend' do
    freq = WordFrequency.new
    file = "#{params[:trend]}.txt"
    @words = freq.find_top_results(20, file)
  end

  

  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
