module Helper

  def read_file(file_path)
    file = File.open(file_path, 'r')
    array = []
    file.readlines.each do |el| 
      array << eval(el.chomp)
    end
    file.close()
    array
  end

  def read_link_file(file_path)
    text = File.read(file_path)
    text.scan(/https?:\/\/[A-Za-z0-9._\/&?#]+/).flatten
  end

  def parse_file(file_path, regex)
    text = File.read(file_path)
    text.scan(/@\w+/).flatten
  end

  def extract_words(array)
    array.join(" ").split(" ").map{ |w| w.downcase.gsub(/\B[@#]\S+\b|(?:f|ht)tps?:\/[^\s]+|[^a-zA-Z0-9%\s]/, "")}
  end

  def reject_words(array)
    array.reject {|w| REJECT_WORDS.include?(w) }
  end

  def count_freq(array)
    word_freq = Hash.new(0)
    array.each {|word| word_freq[word]+=1}
    word_freq
  end

  def filter_top_results(number, hash)
    hash.sort_by {|k, v| v}.reverse[0..(number-1)]
  end

  def find_top_words(number, array)
    words = extract_words(array)
    useful_words = reject_words(words)
    frequency_hash = count_freq(useful_words)
    filter_top_results(number, frequency_hash)
  end
end


