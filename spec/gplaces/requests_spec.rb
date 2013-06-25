require 'spec_helper'

describe 'Http requests' do

  before do
    Gplaces.configure do |c|
      c.api_key = 'AIzaSyBwDiGEq0LaPkY4h-AL7rrd6IPoGJzvhgI'
      c.sensor = false
      c.default_network_adapter = :typhoeus
    end
  end

  context 'Search nearby' do

    context 'return next page data' do
      let(:search) { Gplaces::SearchNearby.new(:radius => 200, :lat => 49.669249, :lng => 18.674966) }

      it 'should return detail data' do
        VCR.use_cassette 'request_search_and_get_detail' do
          data = search.run

          data[:results].first.detail[:status].should == 'OK'
        end
      end

      it 'should return next page' do
        VCR.use_cassette 'request_search_nearby_next_page' do
          data = search.run

          search.run_next(data[:next_page_token])[:status].should == 'OK'
        end
      end

    end

    context 'no results' do
      let(:search) { Gplaces::SearchNearby.new(:radius => 200, :lat => 29.225402, :lng => -40.834175, :types => [:food]) }

      it 'should return ZERO_RESULTS' do
        VCR.use_cassette 'request_search_nearby_noresults' do
          data = search.run

          data[:status].should == 'ZERO_RESULTS'
        end
      end
    end

  end

end