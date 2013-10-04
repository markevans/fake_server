require 'httparty'

module FakeServer
  class RemoteAPI
    def initialize(host)
      @host = host
    end

    attr_reader :host

    def request(method, relative_url)
      response = HTTParty.public_send(method.downcase, "#{host}#{relative_url}")
      [response.code, response.headers, [response.body]]
    end
  end
end
