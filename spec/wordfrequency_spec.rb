require 'wordfrequency'

describe 'WordFrequency' do

  let(:freq){WordFrequency.new}

  test_array = {"how"=> 4, "devolution"=> 4, "see"=> 4, "trade"=> 6, "growth"=> 6, "EU"=> 6, "sector"=> 6, "key"=> 6, "referendum"=>6, "pay"=>7, "britishchambers"=> 8, "bccconf"=>8, "business"=>8, "Cameron"=> 10, "DavidCameron"=> 11, "BCCConf"=> 41}

  it 'should read a file and return an string' do
    expect(freq.read_file('data.txt')).to be_an_instance_of(String)
  end

  it 'can parse text and form an array of words' do
    expect(freq.make_array("I am a bunch of words in a really long string")).to be_an_instance_of(Array)
  end

  it 'should remove prepositions' do
    expect(freq.make_array("I am a bunch of words in a really long string")).not_to include('I', 'am', 'a', 'of', 'in')
  end

  it 'should count the frequency of words contained' do
    expect(freq.count_freq(['bunch', 'bunch', 'words', 'bunch', 'really', 'really', 'long', 'string'])).to eq({"bunch"=> 3, "words"=> 1, "really"=> 2, "long"=> 1, "string" => 1})
  end

  it 'should return the top n number of words' do
    expect(freq.filter_top_words(5, test_array)).to eq([["BCCConf", 41], ["DavidCameron", 11],  ["Cameron", 10], ["business", 8], ["bccconf", 8]])
  end

  it 'should not return any twitter handles' do
    text = freq.read_file('data.txt')
    array = freq.make_array(text)
    expect(array).not_to include('DavidCameron')
    puts array
  end

  it 'should not return any urls starting with http' do
    text = freq.read_file('data.txt')
    array = freq.make_array(text)
    expect(array).not_to include('httpbitlyFLAPPYAPP')    
  end

  it 'should read a file and return a specified number of top results' do
    expect(freq.find_top_words(5, 'data.txt')).to eq([["Cameron", 10], ["business", 8], ["pay", 7], ["trade", 6], ["EU", 6]])
  end

end