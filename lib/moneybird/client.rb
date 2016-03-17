module Moneybird
  class Client
    attr_reader :bearer_token, :_last_response
    attr_accessor :errors
    attr_writer :http

    def initialize(bearer_token)
      @bearer_token = bearer_token
    end

    def base_url
      "https://moneybird.com/api/#{version}/"
    end

    def version
      @version ||= 'v2'
    end

    def http
      @http ||= begin
        uri = uri_for_path(base_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http
      end
    end

    def headers
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{bearer_token}"
      }
    end

    def uri_for_path(path)
      URI.parse(File.join(base_url, path))
    end

    def get(path, headers={})
      uri = uri_for_path(path)
      http = Net::HTTP::Get.new(uri.request_uri, self.headers.merge(headers))
      perform(http)
    end

    def patch(path, body=nil, headers={})
      uri = uri_for_path(path)
      http = Net::HTTP::Patch.new(uri.request_uri, self.headers.merge(headers))
      http.body = body
      perform(http)
    end

    def post(path, body=nil, headers={})
      uri = uri_for_path(path)
      http = Net::HTTP::Post.new(uri.request_uri, self.headers.merge(headers))
      http.body = body
      perform(http)
    end

    def delete(path, headers={})
      uri = uri_for_path(path)
      http = Net::HTTP::Delete.new(uri.request_uri, self.headers.merge(headers))
      perform(http)
    end

    def administrations
      Moneybird::Service::Administration.new(self).all
    end

    private
      def perform(request)
        @_last_response = http.request(request)
      end
  end
end