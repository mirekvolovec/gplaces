module Gplaces

  class SearchNearby < QueryBuilder

    def query
      query_hash :get, Gplaces.api_search_nearby, normalize_params(params)
    end

  end

end