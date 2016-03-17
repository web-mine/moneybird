module Moneybird::Resource::Invoice
  class Details
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      tax_rate_id
      ledger_account_id
      amount
      price
      description
      row_order
      total_price_excl_tax_with_discount
      total_price_excl_tax_with_discount_base
      tax_report_reference
      id
      created_at
      updated_at
    )

    def contact=(attributes)
      @contact = Moneybird::Resource::Contact.build(attributes)
    end
  end
end
