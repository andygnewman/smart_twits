require_relative 'helper'

class TrendFinder

  include Helper

  def find_trends(file_path)
    find_args(file_path, [:name, :filename])
  end

end