# frozen_string_literal: true

require "test_helper"
require 'capybara/cuprite'

Capybara.server_host = '0.0.0.0'
Capybara.app_host = "http://#{`hostname`.strip&.downcase || "0.0.0.0"}"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :cuprite, options: {
    url: ENV['CHROME_URL'],
    browser_options: { 'no-sandbox': nil },
    window_size: [1200, 800]
  }
end
