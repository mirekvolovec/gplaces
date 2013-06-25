module Gplaces
  module Pageable

    def run_next(next_page_token)
      @adapter.query[:params][:next_page_token] = next_page_token
      self.run
    end

  end
end