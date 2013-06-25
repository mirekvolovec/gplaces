require 'spec_helper'

describe Gplaces::Networking::TyphoeusRequest do

  before do
    Gplaces.configure do |c|
      c.api_key = 'AIzaSyBwDiGEq0LaPkY4h-AL7rrd6IPoGJzvhgI'
      c.sensor = false
      c.network_adapter = :typhoeus
    end
  end

  let(:adapter) { Gplaces.network_adapter.new Gplaces::SearchNearby.new(:radius => 200, :lat => 49.669249, :lng => 18.674966).query }

  context 'http requests' do

    it 'should has next page' do

      VCR.use_cassette 'typhoeus_request' do
        result  = adapter.run
        adapter.has_next_page?.should be_true
      end

    end

  end

end