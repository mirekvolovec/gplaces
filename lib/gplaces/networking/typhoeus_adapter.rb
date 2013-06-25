module Gplaces

  class TyphoeusAdapter

    attr_accessor :query

    def initialize(query)
      @query = query
    end

    def run
      response = Typhoeus.get(@query[:url], params: @query[:params])
      Oj.load response.body, symbol_keys:true
    end

  end

end