module Moneybird::Resource
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
      attr_reader :client, :administration_id

      def initialize(client, administration_id)
        @client = client
        @administration_id = administration_id
      end

      def all
        result = client.get("#{administration_id}/tax_rates")

        JSON.parse(result.body).map do |invoice|
          TaxRate.new(self, invoice)
        end
      end
    end
  end
end