module Moneybird::Resource
  class TaxRate
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      name
      percentage
      tax_rate_type
      show_tax
      active
      created_at
      updated_at
    )
  end
end