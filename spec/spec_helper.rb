$LOAD_PATH.unshift('lib')
Dir["lib/*.rb"].each { |file| require File.basename(file) }


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.warnings = false
  config.order = :random
  Kernel.srand config.seed
end
