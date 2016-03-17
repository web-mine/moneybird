module Moneybird
  module Traits
    module FindAll
      def all
        result = client.get(path)

        JSON.parse(result.body).map do |resource|
          build(resource)
        end
      end
    end
  end
end