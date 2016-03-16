module Moneybird
  module Traits
    module AdministrationService
      attr_reader :client, :administration_id

      def initialize(client, administration_id)
        @client = client
        @administration_id = administration_id
      end
    end
  end
end