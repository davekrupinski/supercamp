require "spec_helper"

describe Supercamp::Criteria::Detail do

  let :criteria do
    Supercamp::Criteria::Detail.new
  end

  describe "#contract_code" do

    it "returns Supercamp::Criteria::Detail" do
      expect(criteria.contract_code("yep")).to \
        be_instance_of Supercamp::Criteria::Detail
    end

    it "sets contractCode option" do
      expect {
        criteria.contract_code("CA")
      }.to change(criteria, :options).from({}).to({ "contractCode" => "CA" })
    end

  end


  describe "#id" do

    it "returns Supercamp::Criteria::Detail" do
      expect(criteria.id("yep")).to \
        be_instance_of Supercamp::Criteria::Detail
    end

    it "sets :parkId option" do
      expect {
        criteria.id("11")
      }.to change(criteria, :options).from({}).to({ "parkId" => "11" })
    end

  end

end
