module Gplaces

  class SearchText < QueryBuilder
    include Pageable
    include ListResult

    def query
      query_hash :get, Gplaces.api_search_text, normalize_params(params)
    end

  end

end