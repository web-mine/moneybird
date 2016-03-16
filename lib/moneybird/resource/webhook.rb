module Moneybird::Resource
  class Webhook
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      url
      last_http_status
      last_http_body
    )
  end
end


