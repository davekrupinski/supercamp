require 'spec_helper'

describe Supercamp::Criteria::Campground do
  let :criteria do
    Supercamp::Criteria::Campground.new
  end

  describe '#url' do
    it do
      expect(criteria.url).to eq \
        'http://api.amp.active.com/camping/campgrounds'
    end
  end

  describe '#geo' do
    it 'returns Supercamp::Criteria::Campground' do
      expect(criteria.geo(1, 2)).to be_instance_of Supercamp::Criteria::Campground
    end

    it 'sets :landmarkLat & :landmarkLong' do
      expect {
        criteria.geo(1, 2)
      }.to change(criteria, :options).from({}).to({ 'landmarkLat' => 1, 'landmarkLong' => 2 })
    end
  end

  describe '#state' do
    it 'returns Supercamp::Criteria::Campground' do
      expect(criteria.state('CA')).to be_instance_of Supercamp::Criteria::Campground
    end

    it 'sets :pstate option' do
      expect {
        criteria.state('CA')
      }.to change(criteria, :options).from({}).to({ 'pstate' => 'CA' })
    end
  end

  describe '#name' do
    it 'returns Supercamp::Criteria::Campground' do
      expect(criteria.name('San Francisco')).to be_instance_of Supercamp::Criteria::Campground
    end

    it 'sets :pname option' do
      expect {
        criteria.name('San Francisco')
      }.to change(criteria, :options).from({}).to({ 'pname' => 'San Francisco' })
    end
  end

  describe '#amenity' do
    it 'returns Supercamp::Criteria::Campground' do
      expect(criteria.amenity(:biking)).to be_instance_of Supercamp::Criteria::Campground
    end

    it 'sets :amenity option with code translation' do
      expect {
        criteria.amenity(:biking)
      }.to change(criteria, :options).from({}).to({ 'amenity' => 4001 })
    end
  end

  describe '#has' do
    context 'w/ no perk' do
      it 'returns Supercamp::Criteria::Campground' do
        expect(criteria.has).to be_instance_of Supercamp::Criteria::Campground
      end

      it 'sets no options' do
        expect {
          criteria.has
        }.to_not change(criteria, :options).from({})
      end
    end

    context 'w/ no valid perks' do
      it 'sets no options' do
        expect {
          criteria.has(:boogers)
        }.to_not change(criteria, :options).from({})
      end
    end

    context 'w/ a single perk' do
      it 'sets "waterfront" options' do
        expect {
          criteria.has(:waterfront)
        }.to change(criteria, :options).from({}).to({ 'waterfront' => 3011 })
      end

    end

    context 'w/ multiple valid perks' do
      it 'sets "waterfront" & "pets" options' do
        expect {
          criteria.has(:waterfront, :pets)
        }.to change(criteria, :options).from({}).to({ 'waterfront' => 3011, 'pets' => 3010 })
      end
    end

    context 'w/ multiple valid and invalid perks' do
      it 'sets "waterfront" & "pets" options' do
        expect {
          criteria.has(:pets, :cats)
        }.to change(criteria, :options).from({}).to({ 'pets' => 3010 })
      end
    end
  end
end
