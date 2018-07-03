require 'spec_helper'

describe Supercamp::Response do
  around(:each) do |example|
    VCR.use_cassette 'response of limited campground search' do
      example.run
    end
  end

  let :criteria do
    Supercamp.campgrounds.search do
      site_type 'tent'
      state     'CA'
      amenity   'fishing'
      has       'pets', 'waterfront'
    end
  end

  subject do
    Supercamp::Response.new criteria.query.run
  end

  describe '.new' do
    it 'sets :count' do
      expect(subject.count).to eq 21
    end

    it 'sets array to :entries' do
      expect(subject.entries).to be_instance_of Array
    end

    it 'sets 21 entries' do
      expect(subject.entries.size).to eq 21
    end

    context 'first entry' do
      let(:entry) { subject.entries.first }

      it 'sets Hashr instances' do
        expect(entry).to be_instance_of Hashr
      end

      it 'can access :facility_name' do
        expect(entry.facility_name).to eq 'BUSHAY RECREATION AREA'
        expect(entry[:facility_name]).to eq 'BUSHAY RECREATION AREA'
      end
    end
  end

  describe '#results' do
    it 'returns values from :entries' do
      expect(subject.results).to eq subject.entries
    end
  end
end
