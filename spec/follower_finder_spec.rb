require 'spec_helper'
require 'follower_finder'

describe 'FollowerFinder' do

  let(:followers){FollowerFinder.new}

  context 'find followers' do

    it 'can read a tweets file and return an array of tweets from users with the most followers' do
      expect(followers.find_followers('spec/test_data/followers.txt')).to include(["@HaitiNewsNet", "Miliband accuses Fink of U-turn - Ed Miliband accuses Lord Fink of an \"extraordinary U-turn\" after the Tory donor ... http://t.co/2Esxo0R6RU", 63743 ])
    end

  end

end