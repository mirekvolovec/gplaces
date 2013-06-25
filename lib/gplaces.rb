require 'oj'

require 'gplaces/version'
require 'gplaces/networking/pageable'
require 'gplaces/helpers/query_helper'
require 'gplaces/networking/typhoeus_adapter'

require 'gplaces/query_builder'
require 'gplaces/search_nearby'
require 'gplaces/endpoints'

module Gplaces

  class Configuration
    attr_accessor :api_key, :sensor, :default_network_adapter
  end

  class << self
    attr_accessor :conf

    def configure(&block)
      @conf ||= Configuration.new
      yield(conf) if block_given?
    end

    def default_network_adapter
      case conf.default_network_adapter
        when :typhoeus
          Gplaces::Networking::TyphoeusAdapter
        else
          nil
      end
    end

  end

end
