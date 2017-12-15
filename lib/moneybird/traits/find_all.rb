module Moneybird
  module Traits
    module FindAll
      def all
        client.get(path).map do |resource|
          build resource
        end
      end
    end
  end
end