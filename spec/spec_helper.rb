$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "params_builder"
require "active_support/all"

RSpec.configure do |rspec_config|
  rspec_config.before(:each) do
    ParamsBuilder.configure do |config|
      config.file_path = "#{ParamsBuilder.root}/params_builders"
    end
  end
end
