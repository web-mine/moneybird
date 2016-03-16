module Moneybird::Resource
  class FinancialAccount
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      type
      name
      identifier
      currency
      provider
      active
      created_at
      updated_at
    )
  end
end


