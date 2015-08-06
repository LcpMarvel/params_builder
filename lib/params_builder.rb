require "params_builder/version"
require "params_builder/configuration"
require "yaml"

module ParamsBuilder
  def self.root
    File.dirname __dir__
  end

  def self.build(file_name, variables = {})
    erb_context = Struct.new(*variables.keys) do
      def with_binding
        binding
      end
    end

    path = "#{config.file_path}/#{file_name}.yml.erb"

    YAML.load_stream(
      ERB.new(File.read(path)).result(
        erb_context.new(*variables.values).with_binding
      )
    ).first
  end
end
