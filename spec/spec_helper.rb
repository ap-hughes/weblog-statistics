# frozen_string_literal: true

require 'bundler/setup'
require 'weblog/parser'
require 'weblog/analyser'
require 'weblog/csv_writer'
require 'weblog/terminal_writer'
require 'logfile_error'

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
