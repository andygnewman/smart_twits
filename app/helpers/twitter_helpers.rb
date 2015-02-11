 module Twitter_Helpers 

  def save_data(filename,item)
    file = File.open(filename, 'w')
    file.puts item.to_json
    file.close()  
  end

  def get_tweet_from_file (filename)
    array_of_hashes = []
    file = File.open(filename, 'r')
    file.readlines.each do |el| 
      array_of_hashes << eval(el.chomp)
    end
    file.close()
    return array_of_hashes
  end

 end