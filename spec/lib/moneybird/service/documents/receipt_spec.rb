require "spec_helper"

describe Moneybird::Service::Document::Receipt do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::Document::Receipt.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/documents/receipts')
        .to_return(status: 200, body: fixture_response(:receipts))
    end

    it "returns list of receipts" do
      receipts = service.all

      receipts.length.must_equal 1
      receipts.first.id.must_equal "230699456938378807"
    end
  end
end
