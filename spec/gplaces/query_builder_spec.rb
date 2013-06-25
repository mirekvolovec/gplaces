require 'spec_helper'

describe Gplaces::QueryBuilder do
  context 'Initialization' do
    test_key = SecureRandom.uuid

    before do
      Gplaces.configure do |c|
        c.api_key = test_key
        c.sensor = true
      end
    end

    let(:generator) { Gplaces::QueryBuilder.new sensor:false }

    it { generator.params[:key].should == test_key }
    it { generator.params[:sensor].should == false }

  end

end