require 'sinatra/base'

class SmartTwit < Sinatra::Base
  get '/' do
    'Hello SmartTwit!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
