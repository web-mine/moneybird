module Moneybird::Service
  class Administration
    include Moneybird::Traits::FindAll

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def resource_class
      Moneybird::Resource::Administration
    end

    def path
      '/administrations'
    end
  end
end