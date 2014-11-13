require "spec_helper"

describe Supercamp::Configuration do

  let :configuration do
    Supercamp::Configuration.new
  end

  describe "#configure" do

    context "w/ valid settings" do

      before do
        configuration.configure do |config|
          config.api_key  = "super"
        end
      end

      it { expect(configuration.api_key).to eq "super" }

    end

    context "w/ invalid settings" do

      it do
        expect {
          configuration.configure do |config|
            config.crabs    = "super"
          end
        }.to raise_error NoMethodError
      end

    end

  end
  

  describe "#endpoint" do

    it { expect(configuration.endpoint).to eq "http://api.amp.active.com/camping/campgrounds" }

  end

end
