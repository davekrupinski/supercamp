require "spec_helper"

describe Supercamp do

  describe ".config" do

    it "require Configuration" do
      expect(Supercamp.config).to be_instance_of Supercamp::Configuration
    end

  end

  describe ".configure" do
 
    it do
      Supercamp.configure {}
    end

    pending

  end

end
