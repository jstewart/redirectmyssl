source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 6.1.1"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.2"
gem "webpacker", "~> 6.0.0.beta"
gem "sass-rails", "~> 6"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "devise", "~> 4.7"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 4.0.0"
  gem "factory_bot_rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "rubocop", require: false
  gem "rubocop-rails_config", require: false
  gem "solargraph"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 4.0"
  gem "webdrivers"
end
