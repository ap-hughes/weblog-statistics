# frozen_string_literal: true

RSpec.describe Weblog::TerminalWriter do
  context 'initialising class and running write with hash of records and a heading' do
    it 'should puts to the terminal results' do
      records = [['key_one', 2], ['key_two', 1]]
      expect do
        Weblog::TerminalWriter.new(records, 'Heading').write
      end.to output(a_string_including('key_one', '2', 'key_two', '1')).to_stdout
    end
  end

  context 'initialising class and running write with web records and a heading' do
    let(:parsed_records) { Weblog::Parser.new('spec/fixtures/test.log').parse_file }

    it 'should puts to the terminal results' do
      records = Weblog::Analyser.new(parsed_records).all_visits
      expect do
        Weblog::TerminalWriter.new(records, 'Test').write
      end.to output(a_string_including('/help_page/1', '4', '/index', '2', '/about/2', '1')).to_stdout
    end
  end
end
