module Moneybird
  class Product
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      description
      price
      tax_rate_id
      ledger_account_id
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
        result = client.get("#{administation_id}/products")

        JSON.parse(result.body).map do |invoice|
          Product.new(self, invoice)
        end
      end
    end
  end
end


