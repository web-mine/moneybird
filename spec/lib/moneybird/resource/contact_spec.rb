require "spec_helper"

describe Moneybird::Resource::Contact do
  let(:client) { faked_client }

  let(:contact) { Moneybird::Resource::Contact.build(hash_response(:contact)) }

  it "has events" do
    contact.events.first.must_be_instance_of Moneybird::Resource::Generic::Event
  end
end
