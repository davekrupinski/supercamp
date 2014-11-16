require "spec_helper"

describe Supercamp::Campground do

  describe ".search" do

    it "returns a Supercamp::Criteria" do
      expect(Supercamp::Campground.search {}).to be_instance_of Supercamp::Criteria::Campground
    end

    context "w/ supplied options" do

      let :criteria do
        Supercamp::Campground.search do
          name  "Camp Cool"
          has   :pets
        end
      end

      it "please?" do
        expect(criteria.options).to eq \
          ({ "pname" => "Camp Cool", "pets" => 3010 })
      end

    end

  end


  describe "#endpoint" do

    it { expect(Supercamp::Campground.endpoint).to eq "campgrounds" }

  end

end
