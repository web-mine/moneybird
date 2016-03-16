module Moneybird::Resource
  class Webhook
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      url
      last_http_status
      last_http_body
    )

    class Service
      attr_reader :client, :administration_id

      def initialize(client, administration_id)
        @client = client
        @administration_id = administration_id
      end

      def all
        result = client.get("#{administration_id}/webhooks")

        JSON.parse(result.body).map do |invoice|
          Webhook.new(self, invoice)
        end
      end
    end
  end
end


