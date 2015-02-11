require_relative 'helper'

class WordFrequency

  include Helper

  REJECT_WORDS = ['rt', 'i','a', 'to', 'the', 'on', 'for', 'am','at', 'of', 'do', 'you', 'be', 'in', 'and', 'he', 'with', 'that', 'what', 'are', 'as', 'an', 'all', 'we', "is", "", "can", "this", "now"]
  
  def find_top_results(number, array)
    words = find_words(array)
    useful_words = reject_words(words)
    frequency_hash = count_freq(useful_words)
    filter_top_results(number, frequency_hash)
  end

  def find_words(array)
    array.join(" ").split(" ").map{ |w| w.downcase.gsub(/\B[@#]\S+\b|(?:f|ht)tps?:\/[^\s]+|[^a-zA-Z0-9%\s]/, "")}
  end

  def reject_words(array)
    array.reject {|w| REJECT_WORDS.include?(w) }
  end

end