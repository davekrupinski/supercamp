require "spec_helper"

describe Supercamp::Criteria::Abstract do

  describe ".search" do

    context "Supercamp::Criteria::Campground" do

      it "returns a Supercamp::Criteria" do
        expect(Supercamp::Criteria::Campground.search {}).to be_instance_of Supercamp::Criteria::Campground
      end

      context "w/ supplied options" do

        let :criteria do
          Supercamp::Criteria::Campground.search do
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

  end


  describe "#options" do

    it { expect(subject.options).to eq ({}) }

  end


  describe "#search" do

    context "Supercamp::Criteria::Campground" do

      subject { Supercamp::Criteria::Campground.new }

      it "returns a Supercamp::Criteria" do
        expect(subject.search {}).to be_instance_of Supercamp::Criteria::Campground
      end

      context "w/ supplied options" do

        let :criteria do
          subject.search do
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

  end

  describe "#endpoint" do
    it { expect(subject.endpoint).to eq "http://api.amp.active.com/camping/abstracts" }
  end


  describe "#query" do

    before do
      expect(Supercamp.config).to receive(:api_key).and_return "z"
    end

    let :base_url do
      "http://api.amp.active.com/camping/abstracts?api_key=z"
    end

    context "w/ valid single Supercamp::Criteria" do

      let :criteria do
        subject.tap do |s|
          s.options = { pname: "Jolly Good" }
        end
      end

      it "creates a Typhoeus::Request" do
        expect(criteria.query).to be_instance_of Typhoeus::Request 
      end

      it "combines options w/ endpoint" do
        expect(criteria.query.url).to eq \
          "#{base_url}&pname=Jolly%20Good"
      end

    end

    context "w/ valid multi Supercamp::Criteria" do

      let :criteria do
        subject.tap do |s|
          s.options = { pname: "Jolly Good", amenity: 4001, water: 3007, pets: 3010 }
        end
      end

      it "combines options w/ endpoint" do
        expect(criteria.query.url).to eq \
          "#{base_url}&pname=Jolly%20Good&amenity=4001&water=3007&pets=3010"
      end

    end

    context "w/ special characters in Supercamp::Criteria" do

      let :criteria do
        subject.tap do |s|
          s.options = { pname: "$$%So**??Bad" }
        end
      end

      it "combines options w/ endpoint" do
        expect(criteria.query.url).to eq \
          "#{base_url}&pname=%24%24%25So%2A%2A%3F%3FBad"
      end
    end

  end


  describe "#response" do

    context "w/ valid response" do

      subject do
        Supercamp::Criteria::Campground.search do 
          state     "CA"
          site_type "tent"
          people    4
        end
      end

      it "returns a Supercamp::Response" do
        VCR.use_cassette("campground ca tent") do
          expect(subject.response).to be_instance_of Supercamp::Response
        end
      end

    end

    context "w/ invalid response" do

      before do
        expect(Supercamp.config).to receive(:api_key).and_return nil
      end

      subject do
        Supercamp.campgrounds.search.state("CA")
      end

      it "returns a Supercamp::Error" do
        VCR.use_cassette("campground no api key") do
          expect { subject.response }.to raise_error Supercamp::Error
        end
      end

    end

  end

end
