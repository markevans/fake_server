require 'fake_server/remote_api'
require 'logger'

module FakeServer
  class Server

    def initialize(host, log_file=nil)
      @remote_api = RemoteAPI.new(host)
      @logger = Logger.new(log_file || STDOUT)
    end

    attr_reader :remote_api, :logger

    def call(env)
      url = env["REQUEST_URI"]
      method = env["REQUEST_METHOD"]

      logger.info("#{method} #{url}")
      if method == "GET"
        name = cassette_name(url)
        logger.info("using cassette #{name}")
        VCR.use_cassette(name) { remote_api.request(method, url) }
      else
        remote_api.request(method, url)
      end

    end

    private

    def cassette_name(url)
      name = url.sub(/\/\z/, '')
      name.empty? ? "_root" : name
    end

  end
end
