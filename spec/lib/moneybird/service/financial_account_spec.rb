require "spec_helper"

describe Moneybird::Service::FinancialAccount do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::FinancialAccount.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/financial_accounts', FakeResponse.new(200, json_response(:financial_accounts)))
    end

    it "returns list of financial_accounts" do
      financial_accounts = service.all

      financial_accounts.length.must_equal 1
      financial_accounts.first.id.must_equal "143274045018735618"
    end
  end
end
