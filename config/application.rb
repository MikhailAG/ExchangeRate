require_relative "boot"
require "rails/all"
require "active_job/railtie"

Bundler.require(*Rails.groups)

module ExchangeRate
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_name_prefix = "ExchangeRate_#{Rails.env}"
    Sidekiq.configure_server { |c| c.redis = { url: 'redis://localhost:6379/0' } }
    config.sidekiq_options = YAML.load_file(Rails.root.join('config', 'sidekiq.yml'))
  end
end
