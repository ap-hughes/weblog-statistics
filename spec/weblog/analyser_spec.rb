# frozen_string_literal: true

RSpec.describe Weblog::Analyser do
  let(:records) { Weblog::Parser.new('spec/fixtures/test.log').parse_file }

  context 'initialising class and calling #all_visits' do
    it 'should output an array of arrays in order of descending number' do
      all_visits = [['/help_page/1', 4], ['/index', 2], ['/about/2', 1]]
      expect(Weblog::Analyser.new(records).all_visits).to eq all_visits
    end
  end

  context 'initialising class and calling #unique_visits' do
    it 'should output an array of arrays in order of descending number' do
      unique_visits = [['/help_page/1', 4], ['/about/2', 1], ['/index', 1]]
      expect(Weblog::Analyser.new(records).unique_visits).to eq unique_visits
    end
  end
end
