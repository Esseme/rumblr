source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "pg"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 2.0"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "standard"
  gem "rspec-rails", "~> 5.0.0"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "byebug"
  gem "webdrivers"
  gem "shoulda-matchers", "~> 5.0"
end
