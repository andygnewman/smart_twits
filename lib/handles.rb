class Handles 

  def read_file(file_path)
    File.open(file_path, 'r'){ |f| f.read.gsub(/^\B[@]\S+\b/, "")}.split(" ")
  end

end