require 'handles'

describe 'Handles' do

  let(:handles){Handles.new}
  
  it 'should read a file and return an array' do
    expect(handles.read_file('data.txt')).to be_an_instance_of(Array)
  end

  it 'can create an array of twitter handles' do
    expect(handles.read_file('data.txt')).to include('@britishchambers')
  end

  it 'can find the frequency with which the twitter handles occur' do
    expect(handles.count_freq(["@emilysas", "@emilysas", "@somebodyelse"])).to eq({"@emilysas"=> 2, "@somebodyelse"=>1})
  end

  it 'can find the top n number of twitter handle frequencies' do
    expect(handles.find_top_results(5, 'data.txt')).to eq([["@David_Cameron", 11], ["@britishchambers", 8], ["@edballsmp", 2], ["@coe", 2], ["@cambschamber", 2]])
  end

end