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

  def count_freq(array)
    word_freq = Hash.new(0)
    array.each {|word| word_freq[word]+=1}
    word_freq
  end

  def filter_top_results(number, hash)
    hash.sort_by {|k, v| v}.reverse[0..(number-1)]
  end

end