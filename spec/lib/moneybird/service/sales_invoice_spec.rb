require "spec_helper"

describe Moneybird::Service::SalesInvoice do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::SalesInvoice.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/sales_invoices')
        .to_return(status: 200, body: fixture_response(:sales_invoices))
    end

    it "returns list of sales_invoices" do
      sales_invoices = service.all

      sales_invoices.length.must_equal 3
      sales_invoices.first.id.must_equal "194733567493801235"
    end
  end

  describe "#save" do
    let(:id) { '1' }
    let(:attributes) { { id: id, reference: 'FooBar' } }

    it "creates when not persisted" do
      stub_request(:post, "https://moneybird.com/api/v2/123/sales_invoices")
        .to_return(status: 201, body: fixture_response(:sales_invoice))
      attributes.delete(:id)

      resource = service.build(attributes)
      service.save(resource).must_equal resource
    end

    it "updates when persisted" do
      stub_request(:patch, "https://moneybird.com/api/v2/123/sales_invoices/#{id}")
        .to_return(status: 200, body: fixture_response(:sales_invoice))

      resource = service.build(attributes)
      service.save(resource).must_equal resource
    end
  end

  describe "#send_invoice" do
    before do
      stub_request(:patch, 'https://moneybird.com/api/v2/123/sales_invoices/456/send_invoice')
        .to_return(status: 200, body: fixture_response(:sales_invoice))
    end
    let(:sales_invoice) { Moneybird::Resource::SalesInvoice.new(client: client, id: '456') }
    it "will send the invoice" do
      service.send_invoice(sales_invoice).must_equal sales_invoice
    end
  end
end
