class Handles 

  def read_file(file_path)
    text = File.open(file_path, 'r'){ |f| f.read.gsub(/^@\w+/, "")}.split(" ")
  end

end