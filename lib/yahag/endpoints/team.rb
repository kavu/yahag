# encoding: utf-8

module Yahag
  class Team < Endpoint
    class << self
      def list_users
        http.get("/apps/#{app_id}/app_users")[:app_users]
      end

      def check_user(email)
        body = { email: email, secret: app_secret }
        http.get("/apps/#{app_id}/app_users/check", body: body).code != 404
      end

      def add_user(email, options = {})
        body = {
          email: email,
          first_name: options[:first_name],
          last_name: options[:last_name],
          message: options[:message],
          role: options[:role],
          tags: options[:tags]
        }
        body.delete_if { |_, v| v.nil? }
        http.post("/apps/#{app_id}/app_users", body: body)
      end

      def delete_user(user_id)
        delete("/api/2/apps/#{app_id}/app_users/#{user_id}").status == 200
      end
    end
  end
end
