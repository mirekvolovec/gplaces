module Gplaces

  class TyphoeusAdapter

    attr_accessor :query

    def initialize(query)
      @query = query
    end

    def run
      response = Typhoeus.get(@query[:url], params: @query[:params])
      raise 'Bad response' unless response.code == 200

      Oj.load response.body, symbol_keys:true
    end

  end

end