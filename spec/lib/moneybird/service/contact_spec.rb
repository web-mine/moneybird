require "spec_helper"

describe Moneybird::Service::Contact do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::Contact.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/contacts', FakeResponse.new(200, json_response(:contacts)))
    end

    it "returns list of contacts" do
      contacts = service.all

      contacts.length.must_equal 2
      contacts.first.company_name.must_equal "Foobar Holding B.V."
    end
  end
end
