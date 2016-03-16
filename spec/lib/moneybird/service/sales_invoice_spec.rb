require "spec_helper"

describe Moneybird::Service::SalesInvoice do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::SalesInvoice.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/sales_invoices', FakeResponse.new(200, json_response(:sales_invoices)))
    end

    it "returns list of sales_invoices" do
      sales_invoices = service.all

      sales_invoices.length.must_equal 1
      sales_invoices.first.id.must_equal "143274187727832071"
    end
  end
end
