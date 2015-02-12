require 'sinatra/base'
require_relative 'api_twit'
require_relative 'Wordfrequency'
require_relative 'handles'

class SmartTwit < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }



  # start the server if ruby file executed directly
  run! if app_file == $0
end
