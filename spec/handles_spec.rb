require 'handles'

describe 'Handles' do

  let(:handles){Handles.new}
  
  it 'should read a file and return an array' do
    expect(handles.read_file('data.txt')).to be_an_instance_of(Array)
  end

  xit 'can create an array of twitter handles' do

  end

  xit 'can find the frequency with which the twitter handles occur' do

  end

  xit 'can find the top n number of twitter handle frequencies' do

  end

end