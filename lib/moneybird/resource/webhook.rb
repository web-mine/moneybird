module Moneybird::Resource
  class Webhook
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      url
      last_http_status
      last_http_body
      events
    )
  end
end


