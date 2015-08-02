require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KouponApi
  class Application < Rails::Application
    before_filter :setup_user

    config.autoload_paths << Rails.root.join('lib')
    config.active_record.raise_in_transactional_callbacks = true

    def setup_user
      @user = User.find_by_token(params[:token])
    end

  end
end
