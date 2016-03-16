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

    class Service
      attr_reader :client, :administration_id

      def initialize(client, administration_id)
        @client = client
        @administration_id = administration_id
      end

      def all
        result = client.get("#{administration_id}/sales_invoices")

        JSON.parse(result.body).map do |invoice|
          SalesInvoice.new(self, invoice)
        end
      end
    end
  end
end

