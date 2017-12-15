require "spec_helper"

describe Moneybird::Client do
  let(:client) { Moneybird::Client.new("bearer token") }

  it "sets a username" do
    client.bearer_token.must_equal 'bearer token'
  end

  describe "request handling" do
    it "can do a post request" do
      stub_request(:post, 'https://moneybird.com/api/v2/path')
        .to_return(status: 200, body: { foo: 'bar' }.to_json)
      client.post('/path', 'body').must_equal('foo' => 'bar')
    end

    it "can do a get request" do
      stub_request(:get, 'https://moneybird.com/api/v2/path')
        .to_return(status: 200, body: { foo: 'bar' }.to_json)
      client.get('/path').must_equal('foo' => 'bar')
    end

    it "can do a patch request" do
      stub_request(:patch, 'https://moneybird.com/api/v2/path')
        .to_return(status: 200, body: { foo: 'bar' }.to_json)
      client.patch('/path', 'body').must_equal('foo' => 'bar')
    end

    it "can do a delete request" do
      stub_request(:delete, 'https://moneybird.com/api/v2/path')
        .to_return(status: 200, body: { foo: 'bar' }.to_json)
      client.delete('/path').must_equal('foo' => 'bar')
    end
  end
end
