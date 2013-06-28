require 'spec_helper'

describe Gplaces::QueryHelper do
  context 'Normalized params' do
    let(:params) do
      {
        :lat => 12,
        :lng => 34.5,
        :types => [
          :coffee,
          :food
        ]
      }
    end

    let(:normalized) { Gplaces::QueryHelper.normalize_params params }

    it { normalized[:location].should == '12.00000000,34.50000000' }
    it { normalized[:types].should == 'coffee|food' }

    it 'should not contain lat params' do
      normalized[:lat].should be_nil
    end

    it 'should not contain lng params' do
      normalized[:lng].should be_nil
    end
  end

  context 'build query hash' do
    let(:query) { Gplaces::QueryHelper.query_hash(:get, 'http://test.com', key:true, sensor:true) }

    it 'should have the correct structure' do
      query.should == {
        method: :get,
        url:    'http://test.com',
        params: {
          key:    true,
          sensor: true
        }
      }
    end
  end

end