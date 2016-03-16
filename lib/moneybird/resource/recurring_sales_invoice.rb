module Moneybird::Resource
  class RecurringSalesInvoice
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      contact_id
      contact
      workflow_id
      start_date
      invoice_date
      last_date
      active
      payment_conditions
      reference
      language
      currency
      discount
      first_due_interval
      auto_send
      sending_scheduled_at
      sending_scheduled_user_id
      frequency_type
      frequency
      created_at
      updated_at
      prices_are_incl_tax
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      details
      notes
      attachments
    )
  end
end



