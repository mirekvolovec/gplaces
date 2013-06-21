require 'spec_helper'

describe Gplaces do

  context 'Endpoints methods' do

    context 'Search' do

      context 'api_search_nearby' do
        it { Gplaces.api_search_nearby.should == "#{Gplaces::API_URL}/nearbysearch/json" }
      end

      context 'api_search_text' do
        it { Gplaces.api_search_text.should == "#{Gplaces::API_URL}/textsearch/json" }
      end

      context 'api_search_radar' do
        it { Gplaces.api_search_radar.should == "#{Gplaces::API_URL}/radarsearch/json" }
      end

    end

    context 'Detail' do
      context 'api_detail' do
        it { Gplaces.api_detail.should == "#{Gplaces::API_URL}/details/json" }
      end
    end

  end

end