module ParamsBuilder
  class Configuration
    attr_accessor :file_path

    def initialize
      @file_path = "#{Rails.root}/params_builders" if defined?(Rails)
    end
  end

  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configuration.new
    end
  end
end
