require "spec_helper"

describe Moneybird::Service::Identity do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::Identity.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/identities', FakeResponse.new(200, json_response(:identities)))
    end

    it "returns list of identities" do
      identities = service.all

      identities.length.must_equal 1
      identities.first.company_name.must_equal "Parkietje B.V."
    end
  end
end
