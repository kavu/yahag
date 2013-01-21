# encoding: utf-8

require 'httparty'

module Yahag
  class App
    include HTTParty

    attr_reader :app_id, :app_secret, :app_token

    base_uri 'https://rink.hockeyapp.net/api/2'
    parser Proc.new { |body| MultiJson.load(body, symbolize_keys: true) }

    debug_output $stdout if ENV['DEBUG']

    def initialize(&block)
      # super
      instance_eval(&block) if block_given?
    end

    def list_users
      get("/apps/#{@app_id}/app_users")[:app_users]
    end

    def check_user(email = nil)
      body = { email: email, secret: @app_secret }

      get("/apps/#{@app_id}/app_users/check", body).code != 404
    end

    # first_name: options[:first_name],
    # last_name: options[:last_name],
    # message: options[:message],
    # role: options[:role],
    # tags: options[:tags]

    def add_user(email = nil, options = {})
      body = { email: email }.merge(options)
                             .delete_if { |_, v| v.nil? }

      post("/apps/#{@app_id}/app_users", body)
    end

    def delete_user(user_id = nil)
      delete("/apps/#{@app_id}/app_users/#{user_id}").status == 200
    end

    %w(app_id app_secret app_token).each  do |method|
     class_eval <<-RUBY, __FILE__, __LINE__ + 1
       def #{method}(value)
         @#{method} = value
       end
     RUBY
    end

    private
      %w(get post delete).each do |method|
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{method}(path, body = nil)
            self.class.#{method}(path, body: body, headers: { 'X-HockeyAppToken' => @app_token })
          end
        RUBY
      end
  end
end
