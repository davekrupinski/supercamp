require "spec_helper"

describe Supercamp::Criteria do

  let :criteria do
    Supercamp::Criteria.new
  end

  describe "#state" do

    it "returns Supercamp::Criteria" do
      expect(criteria.state("CA")).to be_instance_of Supercamp::Criteria
    end

    it "sets :pstate option" do
      expect {
        criteria.state("CA")
      }.to change(criteria, :options).from({}).to({ "pstate" => "CA" })
    end

  end


  describe "#name" do

    it "returns Supercamp::Criteria" do
      expect(criteria.name("San Francisco")).to be_instance_of Supercamp::Criteria
    end

    it "sets :pname option" do
      expect {
        criteria.name("San Francisco")
      }.to change(criteria, :options).from({}).to({ "pname" => "San Francisco" })
    end

  end


  describe "#amenity" do

    it "returns Supercamp::Criteria" do
      expect(criteria.amenity(:biking)).to be_instance_of Supercamp::Criteria
    end

    it "sets :amenity option with code translation" do
      expect {
        criteria.amenity(:biking)
      }.to change(criteria, :options).from({}).to({ "amenity" => 4001 })
    end

  end


  describe "#pets" do

    it "returns Supercamp::Criteria" do
      expect(criteria.pets).to be_instance_of Supercamp::Criteria
    end

    it "sets :pets option with code translation" do
      expect {
        criteria.pets
      }.to change(criteria, :options).from({}).to({ "pets" => 3010 })
    end

  end


  describe "#waterfront" do

    it "returns Supercamp::Criteria" do
      expect(criteria.waterfront).to be_instance_of Supercamp::Criteria
    end

    it "sets :waterfont option with code translation" do
      expect {
        criteria.waterfront
      }.to change(criteria, :options).from({}).to({ "waterfront" => 3011 })
    end

  end

end
