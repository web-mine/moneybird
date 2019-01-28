module Moneybird::Resource
  class SalesInvoice
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      attachments
      administration_id
      contact
      contact_id
      created_at
      currency
      custom_fields
      details
      discount
      document_style_id
      draft_id
      due_date
      id
      identity_id
      invoice_date
      invoice_id
      invoice_sequence_id
      language
      notes
      original_sales_invoice_id
      paid_at
      paused
      payment_conditions
      payment_reference
      payments
      prices_are_incl_tax
      public_view_code
      recurring_sales_invoice_id
      reference
      sent_at
      state
      tax_totals
      total_discount
      total_paid
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      total_unpaid
      total_unpaid_base
      updated_at
      url
      version
      workflow_id
      events
    )

    def notes=(notes)
      @notes ||= notes.map{ |note| Moneybird::Resource::Generic::Note.build(note) }
    end

    def contact=(attributes)
      @contact = Moneybird::Resource::Contact.build(attributes)
    end

    def send_invoice(options = {})
      invoice_service = Moneybird::Service::SalesInvoice.new(client, administration_id)
      invoice_service.send_invoice(self, options)
    end

    def payments=(payments)
      payment_data = payments.map{ |payment| Moneybird::Resource::Invoice::Payment.build(payment) }
      @payments = Moneybird::Service::Payment.new(client, administration_id, preloaded_data: payment_data, invoice_id: id)
    end

    def details=(line_items)
      @details = line_items.map{ |line_item| Moneybird::Resource::Invoice::Details.build(line_item) }
    end

    def events=(events)
      @events ||= events.map{ |event| Moneybird::Resource::Generic::Event.build(event) }
    end
  end
end
