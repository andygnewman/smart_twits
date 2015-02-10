# require 'rubygems'
# require 'twitter'

class Twitter

  def load_passes(path)
    return Hash[*File.read(path).split(/[: \n]+/)]
  end
  
end