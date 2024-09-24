source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").strip

gem "administrate", git: "https://github.com/oroth8/administrate.git"
gem "bootsnap", require: false
gem "clearance"
gem "friendly_id"
gem "honeybadger", "~> 5.15"
gem "importmap-rails"
gem "jbuilder"
gem "pg"
gem "puma", "~> 6.4"
gem "rails", "~> 7.2.1"
gem "redis", "~> 5.3"
gem "recipient_interceptor", "~> 0.3.2"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 2.7"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem "standard"
  gem "rspec-rails", "~> 7.0.1"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "selenium-webdriver"
  gem "byebug"
  gem "webdrivers"
  gem "shoulda-matchers", "~> 6.4"
end
