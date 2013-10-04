require 'fake_server/remote_api'

module FakeServer
  class Server

    def initialize(host)
      @remote_api = RemoteAPI.new(host)
    end

    attr_reader :remote_api

    def call(env)
      url = env["REQUEST_URI"]
      method = env["REQUEST_METHOD"]

      if method == "GET"
        VCR.use_cassette(url) { remote_api.request(method, url) }
      else
        remote_api.request(method, url)
      end

    end
  end
end
