# frozen_string_literal: true

RSpec.describe Weblog::CsvWriter do
  context 'initialising class and running write with array of records' do
    it 'should write the array of arrays out to a CSV file under stats folder' do
      records = [['/help_page/1', 4], ['/index', 2], ['/about/2', 1]]
      stringified_records = [['Webpage', 'Test visits'], ['/help_page/1', '4'], ['/index', '2'],
                             ['/about/2', '1']]
      Weblog::CsvWriter.new(records, 'test_visits').write
      expect(CSV.readlines('stats/test_visits_stats.csv')).to eq stringified_records
    end
  end
end
