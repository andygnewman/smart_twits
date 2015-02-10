require 'handles'

describe 'Handles' do

  let(:handles){Handles.new}
  
  it 'should read a file and return an array' do
    expect(handles.read_file('data.txt')).to be_an_instance_of(Array)
  end

  it 'can create an array of twitter handles' do
    expect(handles.read_file('data.txt')).to include('@britishchambers')
    puts handles.read_file('data.txt')
  end

  xit 'can find the frequency with which the twitter handles occur' do

  end

  xit 'can find the top n number of twitter handle frequencies' do

  end

end