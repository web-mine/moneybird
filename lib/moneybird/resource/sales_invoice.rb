module Moneybird::Resource
  class SalesInvoice
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      attachments
      contact
      contact_id
      created_at
      currency
      custom_fields
      details
      discount
      document_style_id
      due_date
      id
      identity_id
      invoice_date
      invoice_id
      language
      notes
      original_sales_invoice_id
      paid_at
      payment_conditions
      payments
      prices_are_incl_tax
      reference
      sent_at
      state
      total_paid
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      total_unpaid
      updated_at
      url
      workflow_id
    )

    def contact=(attributes)
      @contact ||= Moneybird::Resource::Contact.build(attributes)
    end

    def details=(line_items)
      @details ||= line_items.map{ |line_item| Moneybird::Resource::Invoice::Details.build(line_item) }
    end
  end
end

