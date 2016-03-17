module Moneybird::Resource
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

    def notes=(notes)
      @notes ||= notes.map{ |note| Moneybird::Resource::Generic::Note.build(note) }
    end

    def contact=(attributes)
      @contact ||= Moneybird::Resource::Contact.build(attributes)
    end

    def details=(line_items)
      @details ||= line_items.map{ |line_item| Moneybird::Resource::Invoice::Details.build(line_item) }
    end
  end
end