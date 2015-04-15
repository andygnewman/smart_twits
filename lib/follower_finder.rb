require_relative 'helper'

class FollowerFinder

  include Helper
  
  def find_followers(file_path)
    followers_array = read_file(file_path)
    array = []
    followers_array.map{|el| array << [el[:name], el[:text], el[:followers]]}
    array
  end

end