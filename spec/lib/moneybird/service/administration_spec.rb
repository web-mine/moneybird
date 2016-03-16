require "spec_helper"

describe Moneybird::Service::Administration do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::Administration.new(client) }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/administrations', FakeResponse.new(200, json_response(:administrations)))
    end

    it "returns list of administrations" do
      administrations = service.all

      client.http.requests.last.must_equal(["GET", "/api/v2/administrations", nil])

      administrations.length.must_equal 1
      administrations.first.id.must_equal 123
    end
  end
end
