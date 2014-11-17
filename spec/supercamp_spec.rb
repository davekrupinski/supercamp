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


  describe ".campsites" do

    it { expect(Supercamp.campsites).to be_instance_of Supercamp::Criteria::Campsite }

  end


  describe ".campgrounds" do

    it { expect(Supercamp.campgrounds).to be_instance_of Supercamp::Criteria::Campground }

  end


  describe ".details" do

    it { expect(Supercamp.details).to be_instance_of Supercamp::Criteria::Detail }

  end

end
