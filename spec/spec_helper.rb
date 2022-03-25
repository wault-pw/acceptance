# frozen_string_literal: true

require 'pry'
require 'date'
require 'faraday'
require 'nokogiri'
require 'addressable/uri'

require_relative '../lib/cert'
require_relative '../lib/port'
require_relative '../lib/robots'
require_relative '../lib/sitemap'
require_relative '../lib/webpage'

case ENV['LANG']
when "ru"
  require_relative '../config/landing_ru'
  require_relative '../config/eva_ru'
  require_relative '../config/alice_ru'
when "en"
  require_relative '../config/landing_en'
  require_relative '../config/eva_en'
  require_relative '../config/alice_en'
when "zh"
  require_relative '../config/landing_zh'
  require_relative '../config/eva_zh'
  require_relative '../config/alice_zh'
else
  raise "lang <#{ENV['LANG']}> not defined, use LANG=code rspec"
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = "examples.txt"
  config.disable_monkey_patching!
  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.profile_examples = 3
  config.order = :random
  Kernel.srand config.seed
end
