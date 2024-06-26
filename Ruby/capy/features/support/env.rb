require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "webdrivers"
require "money"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "https://demo.nopcommerce.com"
  Webdrivers::Chromedriver.required_version = "114.0.5735.90"
  config.default_max_wait_time = 5
  Money.default_currency = Money::Currency.new("USD")
  I18n.config.available_locales = :en
end
