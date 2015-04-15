require 'spec_helper'
require 'word_finder'

describe 'WordFinder' do

  let(:words){WordFinder.new}

  context 'find words' do

    it 'can read a tweets file and return a list of words' do
      expect(word_finder.read_file('spec/test_data/test.txt')).to be_an_instance_of(Array)
    end

    xit 'can take an array of sentences and symbols and return a list of words' do
      expect(word_finder.extract_words(["hello &*", "HOW are ! you"])).to eq(["hello", "", "how", "are", "", "you"])
    end

    xit 'can take an array of words and reject unwanted words' do
      expect(word_finder.reject_words(["and", "it", "", "was", "stupendous"])).to eq(["stupendous"])
    end

    xit 'can count the frequency with which the words appear' do
      expect(word_finder.count_freq(["hello", "how", "hello", "you", "how"])).to eq({"hello"=>2, "how"=>2, "you"=>1})
    end

    xit 'can return the n most frequently occuring words' do
      expect(word_finder.find_words(3, 'spec/test_data/test.txt')).to eq([["special", 2], ["know", 2], ["rose", 2]])
    end

  end
end