# Pact spike

A spike of using [Pact](https://github.com/uglyog/pact) for contract testing.

`server.rb` a sinatra server that responds with some XML on GET /. Run with `rackup`.

`client.rb` a "client" for the server. Returns the `first_name` from the XML.

`client_spec.rb` a spec using Pact.

`Rakefile` contains the Pact verification task.

To get Pact working with a non-ruby provider, I've used Rack::ReverseProxy to forward requests on to another server when the verification rake task runs. You can see this in the bottom of `pact_helper.rb`.
