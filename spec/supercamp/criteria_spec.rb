require "spec_helper"

describe Supercamp::Criteria do

  let :criteria do
    Supercamp::Criteria.new
  end

  describe "#geo" do

    it "returns Supercamp::Criteria" do
      expect(criteria.geo(1, 2)).to be_instance_of Supercamp::Criteria
    end

    it "sets :landmarkLat & :landmarkLong" do
      expect {
        criteria.geo(1, 2)
      }.to change(criteria, :options).from({}).to({ "landmarkLat" => 1, "landmarkLong" => 2 })
    end

  end


  describe "#site_type" do

    it "returns Supercamp::Criteria" do
      expect(criteria.site_type(:rv)).to be_instance_of Supercamp::Criteria
    end

    it "sets :siteType option with code translation" do
      expect {
        criteria.site_type(:rv)
      }.to change(criteria, :options).from({}).to({ "siteType" => 2001 })
    end

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


  describe "#arrival" do

    it "returns Supercamp::Criteria" do
      expect(criteria.arrival("05/08/1981")).to be_instance_of Supercamp::Criteria
    end

    it "sets :arvdate option" do
      expect {
        criteria.arrival("05/08/1981")
      }.to change(criteria, :options).from({}).to({ "arvdate" => "05/08/1981" })
    end

  end


  describe "#nights" do

    it "returns Supercamp::Criteria" do
      expect(criteria.nights(2)).to be_instance_of Supercamp::Criteria
    end

    it "sets :lengthOfStay option" do
      expect {
        criteria.nights(2)
      }.to change(criteria, :options).from({}).to({ "lengthOfStay" => 2 })
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


  describe "#min_equip_length" do

    it "returns Supercamp::Criteria" do
      expect(criteria.min_equip_length(1)).to be_instance_of Supercamp::Criteria
    end

    it "sets :eqplen option with amount" do
      expect {
        criteria.min_equip_length(61)
      }.to change(criteria, :options).from({}).to({ "eqplen" => 61 })
    end

  end


  describe "#people" do

    it "returns Supercamp::Criteria" do
      expect(criteria.people(15)).to be_instance_of Supercamp::Criteria
    end

    it "sets :people option with amount" do
      expect {
        criteria.people(66)
      }.to change(criteria, :options).from({}).to({ "Maxpeople" => 66 })
    end

  end


  describe "#min_elec_amps" do

    it "returns Supercamp::Criteria" do
      expect(criteria.min_elec_amps(15)).to be_instance_of Supercamp::Criteria
    end

    it "sets :hookup option with code translation" do
      expect {
        criteria.min_elec_amps(15)
      }.to change(criteria, :options).from({}).to({ "hookup" => 3002 })
    end

  end


  describe "#has" do

    context "w/ no perk" do

      it "returns Supercamp::Criteria" do
        expect(criteria.has).to be_instance_of Supercamp::Criteria
      end

      it "sets no options" do
        expect {
          criteria.has
        }.to_not change(criteria, :options).from({})
      end

    end

    context "w/ no valid perks" do

      it "sets no options" do
        expect {
          criteria.has(:boogers)
        }.to_not change(criteria, :options).from({})
      end

    end

    context "w/ a single perk" do

      it "sets 'waterfront' options" do
        expect {
          criteria.has(:waterfront)
        }.to change(criteria, :options).from({}).to({ "waterfront" => 3011 })
      end

    end

    context "w/ multiple valid perks" do

      it "sets 'waterfront' & 'pets' options" do
        expect {
          criteria.has(:waterfront, :pets)
        }.to change(criteria, :options).from({}).to({ "waterfront" => 3011, "pets" => 3010 })
      end

    end

    context "w/ multiple valid and invalid perks" do

      it "sets 'waterfront' & 'pets' options" do
        expect {
          criteria.has(:pets, :cats)
        }.to change(criteria, :options).from({}).to({ "pets" => 3010 })
      end

    end

  end

end
