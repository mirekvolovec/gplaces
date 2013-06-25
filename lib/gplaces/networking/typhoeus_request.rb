module Gplaces
  module Networking

    class TyphoeusRequest

      def initialize(query)
        @query = query
      end

      def run
        response = Typhoeus.get(@query[:url], params: @query[:params])
        data = Oj.load response.body, symbol_keys:true
        @query[:next_page_token] = data[:next_page_token] if data.has_key? :next_page_token
        data
      end

      def has_next_page?
        @query.has_key? :next_page_token
      end

    end

  end
end