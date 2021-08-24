# frozen_string_literal: true

module Weblog
  # Writes out results to the terminal, presenting them in a table
  class TerminalWriter
    def initialize(records, table_heading)
      @records = records.to_h
      @table_heading = table_heading
    end

    def write
      tabulate do
        @records.each do |k, v|
          spacing = (length_of_line - k.size) + 10
          puts "#{k} #{v.to_s.rjust(spacing)}"
        end
      end
    end

    private

    def tabulate
      puts ''
      puts @table_heading
      puts "Webpage #{'Visits'.rjust(length_of_line + 3)}"
      puts '*' * (length_of_line + 11)
      yield
      puts '*' * (length_of_line + 11)
      puts ''
    end

    def length_of_line
      @length_of_line ||= @records.keys.map(&:length).sort.pop
    end
  end
end
