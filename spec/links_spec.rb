require 'links'

describe 'Links' do

  let(:links){Links.new}
  
  it 'should read a file and return an array' do
    expect(links.read_file('data.txt')).to be_an_instance_of(Array)
  end

  xit 'can create an array of links' do
    expect(links.read_file('data.txt')).to include('http://bit.ly/1uztqaI')
  end

  xit 'can find the frequency with which the links occur' do
    expect(links.count_freq(["http://google.com", "http://makersacademy.com", "www.makersacademy.com"])).to eq({"www.makersacademy.com"=> 2, "www.google.com"=>1})
  end

  xit 'can find the top n number of links frequencies' do
    expect(links.find_top_results(5, 'data.txt')).to eq([])
  end

end