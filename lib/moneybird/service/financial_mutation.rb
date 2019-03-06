module Moneybird::Service
  class FinancialMutation
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Synchronization

    def link_booking(resource, booking)
      client.patch("#{resource_path(resource)}/link_booking", booking.to_json)
    end

    # def unlink_booking(resource, booking)
    #   client.delete("#{resource_path(resource)}/unlink_booking", booking.to_json)
    # end

    private

    def resource_class
      Moneybird::Resource::FinancialMutation
    end

    def path
      "#{administration_id}/financial_mutations"
    end
  end
end