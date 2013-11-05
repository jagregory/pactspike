require 'rspec'
require 'pact'
require 'pact/consumer/rspec'
require './client'

Pact.service_consumer 'First Name Getter' do
  has_pact_with 'Name service' do
    mock_service :name_service do
      port 9292
    end
  end
end

describe '#get_first_name', pact: true do
  before do
    name_service.
      given('Normal operation').
      upon_receiving('a request for a user').
      with({ method: :get, path: '/' }).
      will_respond_with({
        status: 200,
        content_type: 'application/xml',
        body: '<user><first_name>James</first_name><last_name>Gregory</last_name></user>'
      })
  end

  it 'returns a first name from the service' do
    get_first_name.should eq 'James'
  end
end
