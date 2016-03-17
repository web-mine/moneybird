require "spec_helper"

describe Moneybird::Service::Contact do
  let(:client) { faked_client }
  let(:resource) { :contact }

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

  describe "#build" do
    it "returns a non persisted contact" do
      contact = service.build(hash_response(:contacts).first)

      contact.firstname.must_equal "John"
    end
  end

  describe "#create" do
    before do
      client.http.register_request(:POST, '/api/v2/123/contacts', FakeResponse.new(201, json_response(resource)))
    end

    it "creates a contact" do
      contact = service.create({company_name: 'ACME', firstname: 'Foo', lastname: 'Bar'})

      contact.id.must_equal hash_response(resource)['id']
    end
  end

  describe "#update" do
    let(:id) { hash_response(resource)['id']}

    before do
      client.http.register_request(:PATCH, "/api/v2/123/contacts/#{id}", FakeResponse.new(201, json_response(resource)))
    end

    it "updates a contact" do
      contact = service.update({id: id, company_name: 'ACME', firstname: 'Foo', lastname: 'Bar'})

      contact.id.must_equal id
    end
  end

  describe "#save" do
    let(:id) { '1' }
    let(:attributes) { {id: id, company_name: 'ACME', firstname: 'Foo', lastname: 'Bar'} }

    it "creates when not persisted" do
      client.http.register_request(:POST, '/api/v2/123/contacts', FakeResponse.new(201, json_response(resource)))
      attributes.delete(:id)

      resource = service.build(attributes)
      service.save(resource).must_equal true
    end

    it "updates when persisted" do
      client.http.register_request(:PATCH, "/api/v2/123/contacts/#{id}", FakeResponse.new(200, json_response(resource)))

      resource = service.build(attributes)
      service.save(resource).must_equal true
    end
  end

  describe "#delete" do
    let(:id) { '1' }
    let(:attributes) { {id: id, company_name: 'ACME', firstname: 'Foo', lastname: 'Bar'} }

    it "creates when not persisted" do
      client.http.register_request(:DELETE, '/api/v2/123/contacts/1', FakeResponse.new(200, json_response(resource)))

      resource = service.build(attributes)
      service.delete(resource).must_equal true
    end
  end

  describe "#find" do
    let(:id) { hash_response(resource)['id']}

    it "creates when not persisted" do
      client.http.register_request(:GET, "/api/v2/123/contacts/#{id}", FakeResponse.new(200, json_response(resource)))

      resource = service.find(id)
      resource.id.must_equal id
    end
  end
end
