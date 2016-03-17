require "spec_helper"

describe Moneybird::Service::LedgerAccount do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::LedgerAccount.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/ledger_accounts', FakeResponse.new(200, json_response(:ledger_accounts)))
    end

    it "returns list of ledger_accounts" do
      ledger_accounts = service.all

      ledger_accounts.length.must_equal 3
      ledger_accounts.first.id.must_equal "143273834459432032"
    end
  end
end
