require_relative 'helper'

class RetweetFinder

  include Helper

  def find_retweets(file_path)
    find_args(file_path, [:text, :retweet])
  end

end