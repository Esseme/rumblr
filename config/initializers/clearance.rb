Clearance.configure do |config|
  config.mailer_sender = ENV.fetch("FROM_EMAIL")
  config.rotate_csrf_on_sign_in = true
end
