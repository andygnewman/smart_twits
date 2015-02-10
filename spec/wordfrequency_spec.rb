require 'wordfrequency'

describe 'WordFrequency' do

  let(:freq){WordFrequency.new}

  it 'can parse text and form an array of words' do
    expect(freq.make_array("I am a bunch of words in a really long string")).to be_an_instance_of(Array)
  end

  it 'should remove prepositions' do
    expect(freq.make_array("I am a bunch of words in a really long string")).not_to include('I', 'am', 'a', 'of', 'in')
  end

  it 'should count the frequency of words contained' do
    expect(freq.count_freq(['bunch', 'bunch', 'words', 'bunch', 'really', 'really', 'long', 'string'])).to eq({"bunch"=> 3, "words"=> 1, "really"=> 2, "long"=> 1, "string" => 1})
  end

  it 'should read a file and return an string' do
    expect(freq.read_file('data.txt')).to be_an_instance_of(String)
  end




end