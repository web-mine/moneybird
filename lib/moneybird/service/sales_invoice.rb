module Moneybird::Service
  class SalesInvoice
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll

    def resource_class
      Moneybird::Resource::SalesInvoice
    end

    def path
      "#{administration_id}/sales_invoices"
    end
  end
end