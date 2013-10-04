require 'thor'
require 'vcr'
require 'rack/handler/puma'
require 'fake_server/server'

module FakeServer
  class CLI < Thor

    desc "start HOST", "start the server, proxying to HOST"
    option :port, type: :numeric, default: 5555
    option :min_threads, type: :numeric, default: 0
    option :max_threads, type: :numeric, default: 16
    option :cassette_dir, default: 'cassettes'
    option :log_file
    def start(remote_host)
      VCR.configure do |c|
        c.cassette_library_dir = options[:cassette_dir]
        c.hook_into :webmock
      end

      Rack::Handler::Puma.run(Server.new(remote_host, options[:log_file]), {
        Port: options[:port],
        Threads: "#{options[:min_threads]}:#{options[:max_threads]}"
      })
    end

  end
end
