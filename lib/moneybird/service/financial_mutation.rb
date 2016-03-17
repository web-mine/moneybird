module Moneybird::Service
  class FinancialMutation
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll

    def resource_class
      Moneybird::Resource::FinancialMutation
    end

    def path
      "#{administration_id}/financial_mutations"
    end
  end
end