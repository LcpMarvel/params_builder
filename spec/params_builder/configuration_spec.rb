require "spec_helper"

RSpec.describe ParamsBuilder::Configuration do
  let(:file_path) { "#{ParamsBuilder.root}/spec/params_builders" }

  it "sets file_path" do
    ParamsBuilder.configure do |config|
      config.file_path = file_path
    end

    expect(ParamsBuilder.config.file_path).to eq file_path
  end
end
