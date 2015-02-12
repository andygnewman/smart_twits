require_relative 'helper'

class Links 

  include Helper

  def find_top_results(number, file_path)
    array = read_link_file(file_path)
    frequency_hash = count_freq(array)
    filter_top_results(number, frequency_hash)
  end

  def read_link_file(file_path)
    text = File.read(file_path)
    text.scan(/https?:\/\/[A-Za-z0-9._\/&?#]+/).flatten
  end

end