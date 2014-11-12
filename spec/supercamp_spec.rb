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


  describe ".search" do

    it "returns a Supercamp::Criteria" do
      expect(Supercamp.search {}).to be_instance_of Supercamp::Criteria
    end

    context "w/ supplied options" do

      let :criteria do
        Supercamp.search do
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
