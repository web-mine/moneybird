module Moneybird
  module Traits
    module SendInvoice
      def resource_path(resource)
        [path, resource.path, '/send_invoice'].join('')
      end

      def send_invoice(resource, options = {})
        client.patch(resource_path(resource), options.to_json)
      end
    end
  end
end
