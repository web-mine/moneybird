module Moneybird::Service
  class FinancialAccount
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::FindAll

    def resource_class
      Moneybird::Resource::FinancialAccount
    end

    def path
      "#{administration_id}/financial_accounts"
    end
  end
end