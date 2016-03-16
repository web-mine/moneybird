require "spec_helper"

describe Moneybird::Service::TaxRate do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::TaxRate.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/tax_rates', FakeResponse.new(200, json_response(:tax_rates)))
    end

    it "returns list of tax_rates" do
      tax_rates = service.all

      tax_rates.length.must_equal 3
      tax_rates.first.id.must_equal "143273834510812265"
    end
  end
end
