require "spec_helper"

describe Moneybird::Service::Workflow do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::Workflow.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/workflows', FakeResponse.new(200, json_response(:workflows)))
    end

    it "returns list of workflows" do
      workflows = service.all

      workflows.length.must_equal 2
      workflows.first.id.must_equal "143273834676487280"
    end
  end
end
