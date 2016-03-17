if ENV['CI']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'minitest/spec'
require 'minitest/autorun'

require 'moneybird'

class FakeHttp
  attr_reader :requests, :registered_requests
  attr_writer :_next_response

  def request(net_http_request)
    @requests ||= []
    @requests << [net_http_request.method,  net_http_request.path, net_http_request.body]

    @_next_response || mapped_response(net_http_request.method, net_http_request.path) || raise("No reponse registered for #{net_http_request.method}: #{net_http_request.path}")
  end

  def register_request(method, path, response)
    @registered_requests ||= {}
    @registered_requests[method.to_sym] ||= {}
    @registered_requests[method.to_sym][path] = response
  end

  def mapped_response(method, path)
    @registered_requests ||= {}
    @registered_requests[method.to_sym] ||= {}
    @registered_requests[method.to_sym][path]
  end

  def reset!
    @requests = []
    @registered_requests = {}
    @_next_response = nil
  end
end

FakeResponse = Struct.new(:code, :body)

def json_response(file)
  File.read("spec/fixtures/responses/#{file}.json")
end

def json_webhook(file)
  File.read("spec/fixtures/webhooks/#{file}.json")
end

def hash_response(file)
  JSON.parse(File.read("spec/fixtures/responses/#{file}.json"))
end


def faked_client
  faked_client = Moneybird::Client.new("bearer token")
  faked_client.http = FakeHttp.new
  faked_client
end