# frozen_string_literal: true

module Weblog
  # Calculates number of visitors to webpages,
  # returning no. of visitors to each webpage in descending order
  class Analyser
    def initialize(records)
      @records = records
    end

    def all_visits
      @all_visits ||= calculate_visits(@records)
    end

    def unique_visits
      @unique_visits ||= calculate_visits(@records.uniq)
    end

    private

    def calculate_visits(records)
      visits = records.to_h { |item| [item[0], records.map(&:first).count(item[0])] }
      visits.sort_by { |_k, v| -v }
    end
  end
end
