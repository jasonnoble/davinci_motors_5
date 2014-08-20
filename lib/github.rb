#!/usr/bin/env ruby

require 'httparty'
require 'json'

class Github
  include HTTParty
  headers "User-Agent" => "davinci_coders"
  basic_auth "YOUR_USERNAME", "YOUR_PASSWORD"

  def endpoint
    "https://api.github.com/authorizations"
  end

  def create_token
    self.class.post endpoint, body: { scopes: [ "public_repo" ], note: "davinci api generator" }.to_json
  end
end

client = Github.new
response = client.create_token

print response.parsed_response
