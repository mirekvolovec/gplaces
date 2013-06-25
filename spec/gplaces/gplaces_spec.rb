require 'spec_helper'

describe Gplaces do
  context 'Configuration' do

    context 'empty configuration' do
      uuid = SecureRandom.uuid
      before do
        Gplaces.configure do |c|
          c.api_key = uuid
          c.sensor = false
        end
      end

      subject { Gplaces.conf }

      its(:api_key) { uuid }
      its(:sensor) { false }

    end

  end
end