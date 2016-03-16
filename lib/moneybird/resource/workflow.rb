module Moneybird::Resource
  class Workflow
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      type
      name
      default
      currency
      language
      active
      prices_are_incl_tax
      created_at
      updated_at
    )
  end
end


