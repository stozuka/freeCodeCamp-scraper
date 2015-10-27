require 'minitest/autorun'
require 'minitest/rg'
require 'vcr'
require 'webmock/minitest'
require_relative '../lib/fcp_class'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

VCR.use_cassette('completed_information') do
  describe 'test' do

    # VCR.insert_cassette('stozuka')
    obj = SiteScraper.new('stozuka')
    obj.file_output # create a test output file

    # before do
    #   VCR.insert_cassette('stozuka')
    #   obj = SiteScraper.new(name)
    #   obj.file_output # create a test output file
    # end

    it 'has same course names and dates' do
      `diff output_spec.txt ./spec/fixtures/output.txt`.must_equal ''
    end

    `rm output_spec.txt`
    # VCR.eject_cassette

    # after do
    #   `rm output_spec.txt`
    #   VCR.eject_cassette
    # end
  end
end
