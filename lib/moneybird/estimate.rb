module Moneybird
  class Estimate
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      contact_id
      contact
      details
      estimate_id
      workflow_id
      document_style_id
      identity_id
      state
      estimate_date
      due_date
      reference
      language
      currency
      exchange_rate
      discount
      original_estimate_id
      show_tax
      sign_online
      sent_at
      accepted_at
      rejected_at
      archived_at
      created_at
      updated_at
      pre_text
      post_text
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      url
      custom_fields
      notes
      attachments
    )

    class Service
      attr_reader :client, :administation_id

      def initialize(client, administation_id)
        @client = client
        @administation_id = administation_id
      end

      def all
        result = client.get("#{administation_id}/estimates")

        JSON.parse(result.body).map do |invoice|
          Estimate.new(self, invoice)
        end
      end
    end
  end
end