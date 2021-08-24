# frozen_string_literal: true

require_relative('weblog/parser')
require_relative('weblog/analyser')
require_relative('weblog/csv_writer')
require_relative('weblog/terminal_writer')
require_relative('logfile_error')

records = if ARGV[0].nil?
            Weblog::Parser.new.parse_file
          else
            Weblog::Parser.new(ARGV[0]).parse_file
          end

analysis = Weblog::Analyser.new(records)

Weblog::TerminalWriter.new(analysis.all_visits, 'All Visits').write
Weblog::TerminalWriter.new(analysis.unique_visits, 'Unique Visits').write

Weblog::CsvWriter.new(analysis.all_visits, 'all_visitors').write
Weblog::CsvWriter.new(analysis.unique_visits, 'unique_visitors').write

puts "These statistics have also been saved as CSVs in the 'weblog-statistics/stats' folder"
