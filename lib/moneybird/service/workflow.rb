module Moneybird::Service
  class Workflow
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::FindAll

    def resource_class
      Moneybird::Resource::Workflow
    end

    def path
      "#{administration_id}/workflows"
    end
  end
end