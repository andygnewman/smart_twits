require_relative 'helper'

class WordFinder

  include Helper

  def find_words(number, file_path)
    words_array = read_file(file_path)
    words = words_array.map{|el| el[:text]}
    find_top_words(number, words)
  end

end