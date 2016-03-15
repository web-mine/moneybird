module Moneybird
  class Administration
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      name
      language
      currency
      country
      time_zone
    )

    def sales_invoices
      Moneybird::SalesInvoice::Service.new(@client, id).all
    end

    def contacts
      Moneybird::Contact::Service.new(@client, id).all
    end

    class Service
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def all
        result = client.get('/administrations')

        JSON.parse(result.body).map do |administration|
          Administration.new(client, administration)
        end
      end
    end
  end
end
