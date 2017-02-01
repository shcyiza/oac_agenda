require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OacAgenda
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = "Brussels"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.before_configuration do
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
      I18n.locale = :fr
      I18n.default_locale = :fr
      config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
      config.i18n.locale = :fr
      # bypasses rails bug with i18n in production\
      I18n.reload!
      config.i18n.reload!
    end

    config.i18n.locale = :fr
    config.i18n.default_locale = :fr
    # For Foundation 5
    config.assets.precompile += %w( vendor/modernizr )


    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.action_mailer.default_url_options = { :host => 'http://kagenda.heroku.app' }
    #Mailjetgem smtp settings
    config.action_mailer.delivery_method = :mailjet
    #trackage d'evenement dans les mails
    config.middleware.use Mailjet::Rack::Endpoint, 'http://kagenda.net/mailjet/callback' do |params|  # using the same URL you just set in Mailjet's administration
        email = params['email'].presence || params['original_address'] # original_address is for typofix events

        if user = User.find_by_email(email)
            user.process_email_callback(params)
        else
            Rails.logger.fatal "[Mailjet] User not found: #{email} -- DUMP #{params.inspect}"
        end
    end
  end
end
