Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.default_url_options = { host: ENV['DOMAIN'] }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method       = :smtp
  config.action_mailer.default charset: "utf-8"
  config.action_mailer.smtp_settings = {
    authentication: :plain,
    address: ENV['MAIL_ADDRESS'],
    port: ENV['MAIL_PORT'],
    user_name: ENV['MAIL_USER_NAME'],
    password: ENV['MAIL_PASSWORD'],
    enable_starttls_auto: true
  }

  # config.middleware.use ExceptionNotification::Rack,
  # :email => {
  #   :email_prefix => "Exception Details: ",
  #   :sender_address => %("Exception Notifier #{ENV['SENDER_ADDRESS']}"),
  #   :exception_recipients => ENV['EXCEPTION_USER_EMAIL']
  # }

  # config.preload_frameworks = true
  # config.allow_concurrency = true
  config.middleware.delete Rack::Lock

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  config.after_initialize do
    Bullet.enable = true
    # Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    # Bullet.add_footer = true
  end

  BetterErrors.editor = :sublime
end
