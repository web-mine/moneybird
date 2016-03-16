module Moneybird::Service
  class Contact
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::FindAll

    def resource_class
      Moneybird::Resource::Contact
    end

    def path
      "#{administration_id}/contacts"
    end
  end
end