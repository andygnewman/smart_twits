require 'api_twit'

describe 'API' do

  let(:twitter) { Twitter.new }
  
  it 'should load passwords' do
    expect(twitter.load_passes('./credentials.md').size).to eq(4)
  end

end