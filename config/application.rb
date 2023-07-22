require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Showbizzy3
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # config.assets.js_compressor = :uglifier
    # config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    #   rewrite %r{.*}, proc { |path, rack_env|
    #     if rack_env['HTTP_HOST'] == 'showbizzy.org'
    #       [301, { 'Location' => "https://www.showbizzy.org#{path}", 'Content-Type' => 'text/html' }, ['Moved Permanently']]
    #     end
    #   }
    # end
  
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
