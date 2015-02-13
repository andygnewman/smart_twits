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

    it 'can take an array of words and reject unwanted words' do
      expect(tweets.reject_words(["and", "it", "", "was", "stupendous"])).to eq(["stupendous"])
    end

    it 'can count the frequency with which the words appear' do
      expect(tweets.count_freq(["hello", "how", "hello", "you", "how"])).to eq({"hello"=>2, "how"=>2, "you"=>1})
    end

    it 'can return the n most frequently occuring words' do
      expect(tweets.find_words(3, 'spec/test_data/test.txt')).to eq([["special", 2], ["know", 2], ["rose", 2]])
    end

  end

  context 'find retweets' do

    it 'can read a tweets file and return an array of tweets and the number of retweets' do
      expect(tweets.find_retweets('spec/test_data/test.txt')).to include(["RT @CNJohansens: What's better than roses this #ValentinesDay? A Rose Petal Body Polish treatment at Armani Hotel Dubai! http://t.co/eD4wIR…", 2])
    end

  end

end