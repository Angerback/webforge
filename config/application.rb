require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rack'
require 'rack/cors'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webforge
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = [:es]
    config.i18n.default_locale = :es

    # Configure Rake CORS
    config.middleware.use "Rack::Cors" do
      allow do
        origins '*'

        resource '/cors',
          headers: :any,
          methods: [:post],
          credentials: true,
          max_age: 0

        resource '/api/v1/*',
          headers: :any,
          methods: [:get, :post, :delete, :put, :options, :head],
          max_age: 0

        resource '*',
          headers: :any,
          methods: [:get, :post, :delete, :put, :options, :head],
          max_age: 0
      end
    end

    config.autoload_paths += %W["#{config.root}/app/validators/"]

    config.assets.paths << Rails.root.join("app", "assets", "fonts")


    # Bower asset paths
    root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end
    # Precompile Bootstrap fonts
    config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff|woff2?)$)
    # Minimum Sass number precision required by bootstrap-sass
    ::Sass::Script::Number.precision = [8, ::Sass::Script::Number.precision].max

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

  end
end
