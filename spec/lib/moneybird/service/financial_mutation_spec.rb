require "spec_helper"

describe Moneybird::Service::FinancialMutation do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::FinancialMutation.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/financial_mutations', FakeResponse.new(200, json_response(:financial_mutations)))
    end

    it "returns list of financial_mutations" do
      financial_mutations = service.all

      financial_mutations.length.must_equal 1
      financial_mutations.first.id.must_equal "143274048181240838"
    end
  end
end
