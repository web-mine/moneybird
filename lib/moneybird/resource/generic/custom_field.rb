module Moneybird::Resource::Generic
  class CustomField
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      value
    )
  end
end
