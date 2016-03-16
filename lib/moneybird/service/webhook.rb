module Moneybird::Service
  class Webhook
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::FindAll

    def resource_class
      Moneybird::Resource::Webhook
    end

    def path
      "#{administration_id}/webhooks"
    end
  end
end