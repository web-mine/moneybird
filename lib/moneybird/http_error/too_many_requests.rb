module Moneybird
  module HttpError
    class TooManyRequests < Faraday::Error
    end
  end
end
