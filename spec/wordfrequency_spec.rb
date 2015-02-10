require 'wordfrequency'

describe 'WordFrequency' do

  let(:freq){WordFrequency.new}

  it 'can parse text and form an array of words' do
    expect(freq.make_array("I am a bunch of words in a really long string")).to be_an_instance_of(Array)
  end

  it 'should remove prepositions' do
    expect(freq.make_array("I am a bunch of words in a really long string")).not_to include('I', 'am', 'a', 'of', 'in')
  end

end