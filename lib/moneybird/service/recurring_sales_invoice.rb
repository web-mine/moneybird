module Moneybird::Service
  class RecurringSalesInvoice
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::FindAll

    def resource_class
      Moneybird::Resource::RecurringSalesInvoice
    end

    def path
      "#{administration_id}/recurring_sales_invoices"
    end
  end
end