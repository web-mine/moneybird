module Moneybird::Service
  class Estimate
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll

    def resource_class
      Moneybird::Resource::Estimate
    end

    def path
      "#{administration_id}/estimates"
    end
  end
end