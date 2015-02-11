require 'sinatra/base'
require_relative 'api_twit'

class SmartTwit < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    twit = APITwitter.new
    twit.get_trends
    @trends_list = twit.trends
    erb :trends
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
