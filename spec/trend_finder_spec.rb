require 'spec_helper'
require 'trend_finder'

describe 'TrendFinder' do

  let(:trends){TrendFinder.new}

  context 'finds trends' do

    it 'can read a tweets file and return a list of trends' do
      expect(trends.read_file('spec/test_data/test_trends.txt')).to be_an_instance_of(Array)
    end

    it 'can create an array of trendnames and filenames' do
      expect(trends.find_trends('spec/test_data/test_trends.txt')).to include(["#WhatIsLoveIn4Words", "WhatIsLoveIn4Words"])
    end

  end
end