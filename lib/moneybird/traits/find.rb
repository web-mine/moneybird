module Moneybird
  module Traits
    module Find
      def find(id)
        result = client.get("#{path}/#{id}")

        build(JSON.parse(result.body))
      end
    end
  end
end