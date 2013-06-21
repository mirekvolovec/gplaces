require 'spec_helper'

describe Gplaces::Client do
  context 'Initialization' do
    test_key = SecureRandom.uuid
    before do
      Gplaces.configure do |c|
        c.api_key = test_key
        c.senzor = true
      end
    end
    let(:client) { Gplaces::Client.new senzor:false }

    it { client.params[:api_key].should == test_key }
    it { client.params[:senzor].should == false }

  end
end