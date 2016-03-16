require "spec_helper"

describe Moneybird::Client do
  let(:client) { Moneybird::Client.new("bearer token") }

  before do
    client.http = FakeHttp.new
  end

  it "sets a username" do
    client.bearer_token.must_equal 'bearer token'
  end

  describe "request handling" do
    before do
      client.http._next_response = FakeResponse.new(200,nil)
    end

    it "can do a post request" do
      client.post('/path', 'body')

      client.http.requests.last.must_equal(["POST", "/api/v2/path", "body"])
    end

    it "can do a get request" do
      client.get('/path')

      client.http.requests.last.must_equal(["GET", "/api/v2/path", nil])
    end

    it "can do a put request" do
      client.put('/path', 'body')

      client.http.requests.last.must_equal(["PUT", "/api/v2/path", "body"])
    end

    it "can do a delete request" do
      client.delete('/path')

      client.http.requests.last.must_equal(["DELETE", "/api/v2/path", nil])
    end

    describe "response" do
      it "stores last response" do
        client.http._next_response = 'somebody'
        response = client.post('/path', 'body')

        response.must_equal 'somebody'
        client._last_response.must_equal('somebody')
      end
    end
  end
end
