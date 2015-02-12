require 'tweets'

describe 'Tweets' do

  let(:tweets){Tweets.new}

  context 'finds trends' do

    it 'can read a tweets file and return a list of trends' do
      expect(tweets.read_file('spec/test.txt')).to be_an_instance_of(Array)
    end

  end

end