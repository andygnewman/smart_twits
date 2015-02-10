class Handles 

  def read_file(file_path)
    text = File.open(file_path, 'r'){ |f| f.read.gsub(/^@\w+/, "")}.split(" ")
  end

  def count_freq(array)
    word_freq = Hash.new(0)
    array.each {|word| word_freq[word]+=1}
    word_freq
  end

end