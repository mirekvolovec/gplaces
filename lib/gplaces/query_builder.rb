module Gplaces
  class QueryBuilder
    include Gplaces::QueryHelper

    attr_accessor :params

    def initialize(opts={})
      @params ||= {}
      @params[:key] = Gplaces.conf.api_key
      @params[:sensor] = Gplaces.conf.sensor
      @params.merge! opts
    end

    def run_request
      Typhoeus::Request
    end

  end
end