require "spec_helper"

describe Moneybird::Service::Estimate do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::Estimate.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/estimates', FakeResponse.new(200, json_response(:estimates)))
    end

    it "returns list of estimates" do
      estimates = service.all

      estimates.length.must_equal 1
      estimates.first.id.must_equal "151540909722305543"
    end
  end
end
