module Moneybird
  module Traits
    module Service
      def build(attributes)
        resource = resource_class.build(attributes)
        resource.client = client
        resource
      end
    end
  end
end