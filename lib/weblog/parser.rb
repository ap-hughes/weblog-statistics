# frozen_string_literal: true

module Weblog
  # Parses .log file data
  class Parser
    attr_reader :filepath

    def initialize(filepath = 'spec/fixtures/webserver.log')
      @filepath = filepath
    end

    def parse_file
      raise LogfileError, "You didn't pass in a file" unless file_exists?
      raise LogfileError, 'File must be a `.log` file type' unless valid_filetype?

      records
    end

    private

    def records
      @records ||= File.readlines(@filepath).map { |string| string.chomp.split }
    end

    def file_exists?
      FileTest.exist?(@filepath)
    end

    def valid_filetype?
      @filepath.end_with?('.log')
    end
  end
end
