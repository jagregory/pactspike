require 'sinatra'
require './server'

Pact.provider_states_for 'First Name Getter' do
  provider_state "Normal operation" do
    set_up do
      # Create a thing here using your factory of choice
    end
  end
end

# using actual Rack app instance
Pact.service_provider "Name service" do
  app { Sinatra::Application.new }
end

# using reverse proxy to another server
# require 'rack/reverse_proxy'
# class Proxy < Sinatra::Base
#   use Rack::ReverseProxy do 
#     reverse_proxy '/', 'http://localhost:9292/'
#   end
# end

# Pact.service_provider "Name service" do
#   app { Proxy.new }
# end