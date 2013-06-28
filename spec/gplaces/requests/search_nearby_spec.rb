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
      c.default_network_adapter = :typhoeus
    end
  end

  let(:search) { Gplaces::SearchNearby.new test_params  }

  it { search.query[:params][:location].should == '12.00000000,34.56000000' }

end