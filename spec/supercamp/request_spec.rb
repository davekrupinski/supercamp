require "spec_helper"

describe Supercamp::Request do

  before do
    Supercamp.configure do |config|
      config.api_key = "z"
    end
  end

  describe "#query" do

    let :request do
      Supercamp::Request.new(criteria)
    end

    let :base_url do
      "http://api.amp.active.com/camping/campgrounds?api_key=z"
    end

    context "w/ valid single Supercamp::Criteria" do

      let :criteria do
        Supercamp.search do
          name "Jolly Good"
        end
      end

      it "creates a Typhoeus::Request" do
        expect(request.query).to be_instance_of Typhoeus::Request 
      end

      it "combines options w/ endpoint" do
        expect(request.query.url).to eq \
          "#{base_url}&pname=Jolly%20Good"
      end

    end

    context "w/ valid multi Supercamp::Criteria" do

      let :criteria do
        Supercamp.search do
          name    "Jolly Good"
          amenity :biking
          has     :water, :pets
        end
      end

      it "combines options w/ endpoint" do
        expect(request.query.url).to eq \
          "#{base_url}&pname=Jolly%20Good&amenity=4001&water=3007&pets=3010"
      end

    end

    context "w/ special characters in Supercamp::Criteria" do

      let :criteria do
        Supercamp.search do
          name    "$$%So**??Bad"
        end
      end

      it "combines options w/ endpoint" do
        expect(request.query.url).to eq \
          "#{base_url}&pname=%24%24%25So%2A%2A%3F%3FBad"
      end
    end

  end


  describe "#response", :vcr do

    context "w/ valid response" do
      
      let :criteria do
        pending
      end

    end

    context "w/ invalid response" do
      pending
    end

  end

end
