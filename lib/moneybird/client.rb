require 'faraday_middleware'

module Moneybird
  class Client
    attr_reader :bearer_token
    attr_accessor :errors
    attr_writer :http, :faraday_adapter

    def initialize(bearer_token)
      @bearer_token = bearer_token
    end

    def base_url
      "https://moneybird.com/"
    end

    def version
      @version ||= 'v2'
    end

    def faraday_adapter
      @faraday_adapter ||= Faraday.default_adapter
    end

    def http
      @http ||= Faraday.new(url: base_url) do |faraday|
        faraday.headers = faraday_headers
        faraday.request :url_encoded
        faraday.response :json
        faraday.use Moneybird::Middleware::ErrorHandling
        faraday.adapter faraday_adapter
      end
    end

    %i[get patch post delete].each do |call|
      define_method call do |path, options = {}|
        http.public_send(call, "/api/#{version}/#{path}", options).body
      end
    end

    def administrations
      Moneybird::Service::Administration.new(self).all
    end

    private

    def faraday_headers
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{bearer_token}"
      }
    end
  end
end