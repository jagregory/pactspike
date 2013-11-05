require 'sinatra'
require './server'

Pact.provider_states_for 'First Name Getter' do
  provider_state "Normal operation" do
    set_up do
      # Create a thing here using your factory of choice
    end
  end
end

Pact.service_provider "Name service" do
  app { Sinatra::Application.new }
end
