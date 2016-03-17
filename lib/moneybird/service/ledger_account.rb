module Moneybird::Service
  class LedgerAccount
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Save

    def resource_class
      Moneybird::Resource::LedgerAccount
    end

    def path
      "#{administration_id}/ledger_accounts"
    end
  end
end