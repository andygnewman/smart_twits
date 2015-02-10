class WordFrequency

REJECT_WORDS = ['I','a', 'to', 'the', 'on', 'for', 'am','at', 'of', 'do', 'you', 'be', 'in', 'and', 'he', 'with', 'that', 'what', 'are', 'as', 'an', 'all', 'we']

  def read_file(file_path)
    File.open(file_path, 'r'){ |f| f.read.gsub(/[^a-zA-Z0-9\s]/, "")}
  end

  def make_array(text)
    text.split(" ").reject {|w| REJECT_WORDS.include?(w) }
  end

  def count_freq(array)
    word_freq = Hash.new(0)
    array.each {|word| word_freq[word]+=1}
    word_freq
  end



end