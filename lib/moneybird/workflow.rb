module Moneybird
  class Workflow
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      type
      name
      default
      currency
      language
      active
      prices_are_incl_tax
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
        result = client.get("#{administration_id}/workflows")

        JSON.parse(result.body).map do |invoice|
          Workflow.new(self, invoice)
        end
      end
    end
  end
end


