module Moneybird::Resource::Documents
  class Receipt
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      currency
      revenue_invoice
      prices_are_incl_tax
      origin
      paid_at
      tax_number
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      details
      payments
      currency
      revenue_invoice
      prices_are_incl_tax
      origin
      paid_at
      tax_number
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      details
      payments
    )
  end
end