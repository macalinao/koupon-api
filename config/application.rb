require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KouponApi
  class Application < Rails::Application

    config.autoload_paths << Rails.root.join('lib')
    config.active_record.raise_in_transactional_callbacks = true

    def authenticate
      @user = User.find_by_token(params[:access_token])
    end

    def force_authenticate
      if @user.blank?
        render status: 401, json: {
          error: "Unauthorized"
        }
      end
    end

  end
end
