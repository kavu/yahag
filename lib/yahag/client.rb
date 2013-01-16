# encoding: utf-8

require 'httparty'

module Yahag
  class Client
    include Singleton
    include HTTParty

    base_uri 'https://rink.hockeyapp.net/api/2'

    parser Proc.new { |body| MultiJson.load(body, symbolize_keys: true) }

    class << self
      attr_accessor :app_id, :app_secret, :app_token

      def http
        self
      end

      def config(&block)
        yield self if block_given?
        headers 'X-HockeyAppToken' => @app_token
      end
    end
  end
end
