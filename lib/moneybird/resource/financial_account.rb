module Moneybird::Resource
  class FinancialAccount
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      description
      price
      tax_rate_id
      ledger_account_id
      created_at
      updated_at
    )
  end
end


