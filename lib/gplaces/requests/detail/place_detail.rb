module Gplaces

  class PlaceDetail < RequestBuilder
    include SingleResult

    def query
      query_hash :get, Gplaces.api_detail, normalize_params(params)
    end

  end

end