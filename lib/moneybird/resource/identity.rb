module Moneybird::Resource
  class Identity
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      company_name
      city
      country
      zipcode
      address1
      address2
      email
      phone
      bank_account_name
      bank_account_number
      bank_account_bic
      custom_fields
      created_at
      updated_at
    )
  end
end