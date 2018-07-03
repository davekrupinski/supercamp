require 'spec_helper'

describe Supercamp::Criteria::Campsite do
  let :criteria do
    Supercamp::Criteria::Campsite.new
  end

  describe '#url' do
    it do
      expect(criteria.url).to eq \
        'http://api.amp.active.com/camping/campsites'
    end
  end

  describe '#site_type' do
    it 'returns Supercamp::Criteria::Campsite' do
      expect(criteria.site_type(:rv)).to be_instance_of Supercamp::Criteria::Campsite
    end

    it 'sets :siteType option with code translation' do
      expect {
        criteria.site_type(:rv)
      }.to change(criteria, :options).from({}).to({ 'siteType' => 2001 })
    end
  end

  describe '#arrival' do
    it 'returns Supercamp::Criteria::Campsite' do
      expect(criteria.arrival('05/08/1981')).to be_instance_of Supercamp::Criteria::Campsite
    end

    it 'sets :arvdate option' do
      expect {
        criteria.arrival('05/08/1981')
      }.to change(criteria, :options).from({}).to({ 'arvdate' => '05/08/1981' })
    end
  end

  describe '#nights' do
    it 'returns Supercamp::Criteria::Campsite' do
      expect(criteria.nights(2)).to be_instance_of Supercamp::Criteria::Campsite
    end

    it 'sets :lengthOfStay option' do
      expect {
        criteria.nights(2)
      }.to change(criteria, :options).from({}).to({ 'lengthOfStay' => 2 })
    end
  end

  describe '#min_equip_length' do
    it 'returns Supercamp::Criteria::Campsite' do
      expect(criteria.min_equip_length(1)).to be_instance_of Supercamp::Criteria::Campsite
    end

    it 'sets :eqplen option with amount' do
      expect {
        criteria.min_equip_length(61)
      }.to change(criteria, :options).from({}).to({ 'eqplen' => 61 })
    end
  end

  describe '#people' do
    it 'returns Supercamp::Criteria::Campsite' do
      expect(criteria.people(15)).to be_instance_of Supercamp::Criteria::Campsite
    end

    it 'sets :people option with amount' do
      expect {
        criteria.people(66)
      }.to change(criteria, :options).from({}).to({ 'Maxpeople' => 66 })
    end
  end

  describe '#min_elec_amps' do
    it 'returns Supercamp::Criteria::Campsite' do
      expect(criteria.min_elec_amps(15)).to be_instance_of Supercamp::Criteria::Campsite
    end

    it 'sets :hookup option with code translation' do
      expect {
        criteria.min_elec_amps(15)
      }.to change(criteria, :options).from({}).to({ 'hookup' => 3002 })
    end
  end
end
