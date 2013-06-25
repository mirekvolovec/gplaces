require 'oj'

require 'gplaces/version'
require 'gplaces/response/pageable'
require 'gplaces/response/single_result'
require 'gplaces/response/list_result'

require 'gplaces/helpers/query_helper'
require 'gplaces/networking/typhoeus_adapter'

require 'gplaces/requests/request_builder'
require 'gplaces/requests/search/search_text'
require 'gplaces/requests/search/search_nearby'
require 'gplaces/requests/detail/place_detail'
require 'gplaces/endpoints'

require 'gplaces/models/place'

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
          Gplaces::TyphoeusAdapter
        else
          nil
      end
    end

  end

end
