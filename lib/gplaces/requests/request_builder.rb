module Gplaces

  class RequestBuilder
    include QueryHelper

    attr_accessor :params

    def initialize(opts={})
      @params ||= {}
      @params[:key] = Gplaces.conf.api_key
      @params[:sensor] = Gplaces.conf.sensor
      @params.merge! opts

      @adapter = Gplaces.default_network_adapter.new query
    end

  end

end