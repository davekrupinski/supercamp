require "spec_helper"

describe Supercamp::Criteria::Abstract do

  before do
    Supercamp.configure do |config|
      config.api_key = "z"
    end
  end


  describe "#options" do

    it { expect(subject.options).to eq ({}) }

  end


  describe "#query" do

    let :base_url do
      "http://api.amp.active.com/camping?api_key=z"
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


  describe "#response", :vcr do

    context "w/ valid response" do
      pending
    end

    context "w/ invalid response" do
      pending
    end

  end

end
