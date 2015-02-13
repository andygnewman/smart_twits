require_relative 'helper'

class Tweets

  include Helper

  
  def find_trends(file_path)
    find_args(file_path, [:name, :filename])
  end

  def find_words(number, file_path)
    words_array = read_file(file_path)
    words = words_array.map{|el| el[:text]}
    find_top_words(number, words)
  end

  def find_retweets(file_path)
    find_args(file_path, [:text, :retweet])
  end

  def find_followers(file_path)
    followers_array = read_file(file_path)
    array = []
    followers_array.map{|el| array << [el[:name], el[:text], el[:followers]]}
    array
  end

  def find_mentions(number, file_path)
    array = parse_file(file_path, /@\w+/)
    frequnecy_hash = count_freq(array)
    filter_top_results(number, frequnecy_hash)
  end

  # def find_links(number, file_path)
  #   array = parse_file(file_path, /https?:\/\/[A-Za-z0-9._\/&?#]+/)
  #   frequency_hash = count_freq(array)
  #   filter_top_results(number, frequency_hash)
  # end

end


