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
      Moneybird::Service::SalesInvoice.new(@client, id).all
    end

    def recurring_sales_invoices
      Moneybird::Service::RecurringSalesInvoice.new(@client, id).all
    end

    def contacts
      Moneybird::Service::Contact.new(@client, id).all
    end

    def estimates
      Moneybird::Service::Estimate.new(@client, id).all
    end

    def products
      Moneybird::Service::Product.new(@client, id).all
    end

    def webhooks
      Moneybird::Service::Webhook.new(@client, id).all
    end

    def identities
      Moneybird::Service::Identity.new(@client, id).all
    end

    def workflows
      Moneybird::Service::Workflow.new(@client, id).all
    end

    def tax_rates
      Moneybird::Service::TaxRate.new(@client, id).all
    end

    def financial_accounts
      Moneybird::Service::FinancialAccount.new(@client, id).all
    end

    def financial_mutations
      Moneybird::Service::FinancialMutation.new(@client, id).all
    end
  end
end
