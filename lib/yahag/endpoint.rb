# encoding: utf-8

module Yahag
  class Endpoint
    include Singleton

    class << self
      %w[app_id app_secret app_token http].each do |method|
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{method}
            Yahag::Client.#{method}
          end
          protected :#{method}
        RUBY
      end
    end
  end
end
