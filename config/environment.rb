# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SpApp::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => ENV['SENDGRID_DOMAIN'],
    :enable_starttls_auto => true
}

Time::DATE_FORMATS[:clean_date] = "%-m/%-d/%y"
