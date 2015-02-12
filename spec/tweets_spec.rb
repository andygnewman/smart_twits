require 'tweets'

describe 'Tweets' do

  let(:tweets){Tweets.new}

  context 'finds trends' do

    it 'can read a tweets file and return a list of trends' do
      expect(tweets.read_file('spec/test_data/test_trends.txt')).to be_an_instance_of(Array)
    end

    it 'can create an array of trendnames and filenames' do
      expect(tweets.find_trends('spec/test_data/test_trends.txt')).to include(["#WhatIsLoveIn4Words", "WhatIsLoveIn4Words"])
    end

  end

  context 'find words' do

    it 'can read a tweets file and return a list of words' do
      expect(tweets.read_file('spec/test_data/test.txt')).to be_an_instance_of(Array)
    end

    it 'can take an array of sentences and symbols and return a list of words' do
      expect(tweets.extract_words(["hello &*", "HOW are ! you"])).to eq(["hello", "", "how", "are", "", "you"])
    end

  end

end