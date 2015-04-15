require 'spec_helper'
require 'retweet_finder'

describe 'RetweetFinder' do

  let(:retweets){RetweetFinder.new}

  context 'find retweets' do

    it 'can read a tweets file and return an array of tweets and the number of retweets' do
      expect(retweets.find_retweets('spec/test_data/test.txt')).to include(["RT @CNJohansens: What's better than roses this #ValentinesDay? A Rose Petal Body Polish treatment at Armani Hotel Dubai! http://t.co/eD4wIR…", 2])
    end

  end

end