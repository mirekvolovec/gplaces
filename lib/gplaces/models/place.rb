module Gplaces

  class Place < Hash

    def detail
      @detail ||= Gplaces::PlaceDetail.new(reference: self[:reference]).run
    end

  end

end