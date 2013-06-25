require 'oj'

require 'gplaces/version'
require 'gplaces/helpers/query_helper'
require 'gplaces/networking/typhoeus_request'

require 'gplaces/query_builder'
require 'gplaces/search_nearby'
require 'gplaces/endpoints'

module Gplaces

  class Configuration
    attr_accessor :api_key, :sensor, :network_adapter
  end

  class << self
    attr_accessor :conf

    def configure(&block)
      @conf ||= Configuration.new
      yield(conf) if block_given?
    end

    def network_adapter
      case conf.network_adapter
        when :typhoeus
          Gplaces::Networking::TyphoeusRequest
        else
          nil
      end
    end

  end

end
