require "spec_helper"

describe Supercamp do

  describe ".config" do

    it "is nil by default" do
      expect(Supercamp.config).to be_nil
    end

    it "is set by .configure" do
      expect {
        Supercamp.configure {}
      }.to change(Supercamp, :config).from(nil)
      expect(Supercamp.config).to be_instance_of Supercamp::Configuration
    end

  end

  describe ".configure" do
 
    it do
      Supercamp.configure {}
    end

  end

end
