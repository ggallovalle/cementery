require "active_support/concern"

module Configurable
  extend ActiveSupport::Concern

  class_methods do
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end

  class Configuration
    attr_accessor :app_id, :title, :cookie_name
  end

  #region with
  def self.with(*attrs)
    config_class = Class.new do 
      attr_accessor *attrs
    end
    class_methods = Module.new do
      define_method :config do
        @config ||= config_class.new
      end

      def configure
        yield config
      end
    end

    Module.new do
      singleton_class.send :define_method, :included do |base|
        base.extend class_methods
      end
    end
  end
  #endregion with

  #region withc
  # def self.withc(*attrs)
  #   config_class = Class.new do 
  #     attr_accessor *attrs
  #   end

  #   # NOTE: module definition in method body doesn't work
  #   module A
  #     extend ActiveSupport::Concern

  #     class_methods do 
  #       def config
  #         @config ||= config_class.new
  #       end

  #       def configure
  #         yield config
  #       end
  #     end
  #   end
  # end
  #endregion withc

  #region withcv2
  def self.withcv2(*attrs)
    config_class = Class.new do 
      attr_accessor *attrs
    end

    Module.new do
      extend ActiveSupport::Concern

      class_methods do 
        def config
          @config ||= config_class.new
        end

        def configure
          yield config
        end
      end
    end
  end
  #endregion withcv2
end

class App
  include Configurable
end

App.configure do |config|
  config.title = "Hola"
end

p App.config

class AppWith
  include Configurable.with :ok, :error
end

AppWith.configure do |config|
  config.ok = true
end

p AppWith.config

# class AppWithC
#   include Configurable.with :is_with_c
# end

# AppWithC.configure do |config|
#   config.is_with_c = "yes"
# end

# p AppWithC.config

class AppWithCV2
  include Configurable.with :is_with_c
end

AppWithCV2.configure do |config|
  config.is_with_c = "yes"
end

p AppWithCV2.config
