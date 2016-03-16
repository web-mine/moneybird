module Moneybird
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
      attr_reader :client, :administation_id

      def initialize(client, administation_id)
        @client = client
        @administation_id = administation_id
      end

      def all
        result = client.get("#{administation_id}/webhooks")

        JSON.parse(result.body).map do |invoice|
          Webhook.new(self, invoice)
        end
      end
    end
  end
end


