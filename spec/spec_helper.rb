require "rspec"
require "capybara"
require "capybara/rspec"
require_relative "../models/articles"
require_relative "../app"

Capybara.app = Sinatra::Application
