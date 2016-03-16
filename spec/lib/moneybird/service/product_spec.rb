require "spec_helper"

describe Moneybird::Service::Product do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::Product.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/products', FakeResponse.new(200, json_response(:products)))
    end

    it "returns list of products" do
      products = service.all

      products.length.must_equal 1
      products.first.id.must_equal "143274140103607298"
    end
  end
end
