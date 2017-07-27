require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WiseMind
  class Application < Rails::Application
    # Force new test files to be generated in the minitest-spec style
    config.generators do |g|
      g.test_framework :minitest, spec: true
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*', 'localhost/8080', 'http://wiseminding.s3-website-us-west-2.amazonaws.com/'
        resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options]
      end
  # Allow CORS (cross origin resource sharing)
  # Read More: https://demisx.github.io/rails-api/2014/02/18/configure-accept-headers-cors.html
    # config.Access-Control-Allow-Origin.action_dispatch.default_headers = {
  # Access-Control-Allow-Origin = 'http://my-web-service-consumer-site.com'
  # Access-Control-Request-Method = %w{GET POST OPTIONS}.join(",")

    end
  end
end
