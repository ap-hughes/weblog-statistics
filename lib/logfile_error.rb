# frozen_string_literal: true

# Custom error handler for incorrect log file input
class LogfileError < StandardError
  def initialize(msg = 'File invalid')
    super
  end
end
