require 'rspec'
require './client'

describe '#get_first_name' do
  it 'returns a first name from the service' do
    get_first_name.should eq 'James'
  end
end
