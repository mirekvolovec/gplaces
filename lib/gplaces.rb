require 'gplaces/version'
require 'gplaces/client'
require 'gplaces/endpoints'

module Gplaces

  class Configuration
    attr_accessor :api_key, :senzor
  end

  class << self
    attr_accessor :conf

    def configure(&block)
      @conf ||= Configuration.new
      yield(conf) if block_given?
    end

  end

end
