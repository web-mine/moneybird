

module Moneybird
  class TaxRate
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      name
      percentage
      tax_rate_type
      show_tax
      active
      created_at
      updated_at
    )

    class Service
      attr_reader :client, :administation_id

      def initialize(client, administation_id)
        @client = client
        @administation_id = administation_id
      end

      def all
        result = client.get("#{administation_id}/tax_rates")

        JSON.parse(result.body).map do |invoice|
          TaxRate.new(self, invoice)
        end
      end
    end
  end
end