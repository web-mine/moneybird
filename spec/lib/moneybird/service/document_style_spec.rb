require "spec_helper"

describe Moneybird::Service::DocumentStyle do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::DocumentStyle.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/document_styles', FakeResponse.new(200, json_response(:document_styles)))
    end

    it "returns list of document_styles" do
      document_styles = service.all

      document_styles.length.must_equal 1
      document_styles.first.name.must_equal "Default"
    end
  end
end
