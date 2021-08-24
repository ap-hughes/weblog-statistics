# frozen_string_literal: true

RSpec.describe 'Weblog::Parser normal function' do
  let(:file) { Weblog::Parser.new }

  context 'initialising the class with no args' do
    it 'should default the filepath to webserver.log example' do
      expect(file.filepath).to eq 'spec/fixtures/webserver.log'
    end
  end

  context 'initialising the class with the correct log filetype argument' do
    it 'should accept the filepath argument' do
      file = Weblog::Parser.new('spec/fixtures/test.log')
      expect(file.filepath).to eq 'spec/fixtures/test.log'
    end
  end

  context 'parsing the file for records #parse_file' do
    it 'should return an array of records' do
      file = Weblog::Parser.new('spec/fixtures/test.log')
      records = [['/help_page/1', '126.318.035.038'], ['/help_page/1', '646.865.545.408'],
                 ['/help_page/1', '929.398.951.889'], ['/help_page/1', '722.247.931.582'],
                 ['/about/2', '444.701.448.104'], ['/index', '444.701.448.104'],
                 ['/index', '444.701.448.104']]
      expect(file.parse_file).to eq records
    end
  end
end

RSpec.describe 'Weblog::Parser error handling' do
  context 'parsing an instance of the parser with no file' do
    it 'should reject the filetype and return an error' do
      file = Weblog::Parser.new('spec/fixtures/not_here.log')
      expect { file.parse_file }.to raise_error(LogfileError, "You didn't pass in a file")
    end
  end

  context 'parsing an instance of the parser with an invalid filetype' do
    it 'should reject the filetype and return an error' do
      file = Weblog::Parser.new('spec/fixtures/wrong.csv')
      expect { file.parse_file }.to raise_error(LogfileError, 'File must be a `.log` file type')
    end
  end
end
