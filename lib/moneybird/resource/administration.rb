module Moneybird::Resource
  class Administration
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      name
      language
      currency
      country
      time_zone
    )

    def sales_invoices
      Moneybird::SalesInvoice::Service.new(@client, id).all
    end

    def recurring_sales_invoices
      Moneybird::RecurringSalesInvoice::Service.new(@client, id).all
    end

    def contacts
      Moneybird::Contact::Service.new(@client, id).all
    end

    def estimates
      Moneybird::Estimate::Service.new(@client, id).all
    end

    def products
      Moneybird::Product::Service.new(@client, id).all
    end

    def webhooks
      Moneybird::Webhook::Service.new(@client, id).all
    end

    def workflows
      Moneybird::Workflow::Service.new(@client, id).all
    end
  end
end
