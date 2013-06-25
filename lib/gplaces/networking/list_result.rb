module Gplaces
  module ListResult
    def run
      data = @adapter.run
      data[:results].map! {|p| Place[p]}
      data
    end
  end
end