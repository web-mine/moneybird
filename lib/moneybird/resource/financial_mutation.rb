module Moneybird::Resource
  class FinancialMutation
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      amount
      code
      date
      message
      contra_account_name
      contra_account_number
      state
      amount_open
      sepa_fields
      batch_reference
      financial_account_id
      currency
      original_amount
      financial_statement_id
      processed_at
      payments
      ledger_account_bookings
      created_at
      updated_at
    )
  end
end
