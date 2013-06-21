module Gplaces
  class Client
    attr_accessor :params

    def initialize(opts={})
      @params = {}
      @params[:api_key] = Gplaces.conf.api_key
      @params[:senzor] = Gplaces.conf.senzor
      @params.merge! opts
    end

  end
end