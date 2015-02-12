require 'links'

describe 'Links' do

  let(:links){Links.new}
  
  xit 'should read a file and return an array' do
    expect(links.read_file('data.txt')).to be_an_instance_of(Array)
  end

  xit 'can create an array of links' do
    expect(links.read_file('data.txt')).to include('http://bit.ly/1uztqaI')
    puts links.read_file('data.txt')
  end

  xit 'can find the frequency with which the links occur' do
    expect(links.count_freq(["http://google.com", "http://makersacademy.com", "http://makersacademy.com"])).to eq({"http://makersacademy.com"=> 2, "http://google.com"=>1})
  end

  xit 'can find the top n number of links frequencies' do
    expect(links.find_top_results(5, 'data.txt')).to eq([["http://bit.ly/FLAPPYAPP", 2], ["http://ow.ly/INMlU", 2], ["http://bit.ly/1y5XLZx", 2], ["http://goo.gl/1SWg4g", 2], ["http://bit.ly/1uztqaI", 2]])
  end

end