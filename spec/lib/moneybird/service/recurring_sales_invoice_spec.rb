require "spec_helper"

describe Moneybird::Service::RecurringSalesInvoice do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::RecurringSalesInvoice.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/recurring_sales_invoices', FakeResponse.new(200, json_response(:recurring_sales_invoices)))
    end

    it "returns list of recurring_sales_invoices" do
      recurring_sales_invoices = service.all

      recurring_sales_invoices.length.must_equal 1
      recurring_sales_invoices.first.id.must_equal "143274163041207303"
    end
  end
end
