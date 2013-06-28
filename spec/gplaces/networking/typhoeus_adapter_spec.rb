require 'spec_helper'

describe Gplaces::TyphoeusAdapter do
  test_query = {
    :method => :head,
    :url    => Gplaces::API_URL,
    :params => {
      :test => true
    }
  }
  let(:adapter) { Gplaces::TyphoeusAdapter.new test_query }


  it 'should call proper request' do
    VCR.use_cassette 'typhoeus_adapter' do
      #adapter.should_receive('Typhoeus.get')
      adapter.run
    end
  end

end