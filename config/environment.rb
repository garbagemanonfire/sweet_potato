# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SpApp::Application.initialize!

config.action_mailer.default_url_options = { :host => 'sweetpotato.heroku.com' }


ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => ENV['SENDGRID_DOMAIN'],
  :enable_starttls_auto => true
}
