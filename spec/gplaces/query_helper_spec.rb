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

end