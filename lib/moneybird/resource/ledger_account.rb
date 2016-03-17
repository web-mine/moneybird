module Moneybird::Resource
  class LedgerAccount
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      name
      account_type
      account_id
      parent_id
      created_at
      updated_at
    )
  end
end