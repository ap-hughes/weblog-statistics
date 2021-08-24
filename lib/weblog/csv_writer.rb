# frozen_string_literal: true

module Weblog
  # Outputs results to a CSV file
  class CsvWriter
    require 'csv'

    def initialize(records, title)
      @records = records
      @title = title
    end

    def write
      CSV.open("stats/#{@title}_stats.csv", 'wb') do |csv|
        formatted_data.each { |elem| csv << elem }
      end
    end

    private

    def formatted_data
      @records.prepend(['Webpage', @title.capitalize.gsub('_', ' ')])
    end
  end
end
