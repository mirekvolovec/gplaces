require 'spec_helper'

describe Gplaces::SearchNearby do
  test_key = SecureRandom.uuid
  test_params = {
    :lat => 12,
    :lng => 34.5600,
    :radius   => 2000,
    :type     => [:food, :coffee]
  }
  before :all do
    Gplaces.configure do |c|
      c.api_key = test_key
      c.sensor = true
    end
  end

  let(:search) { Gplaces::SearchNearby.new test_params  }

  it { search.query[:params][:location].should == '12.00000000,34.56000000' }
  #it { search.query[:url].should == "#{Gplaces::API_URL}/nearbysearch/json" }
  #it { search.query[:query].should == "?key=#{test_key}&senzor=#{Gplaces.conf.senzor}&location=15.0000,30.0000&type=food|coffee" }

end