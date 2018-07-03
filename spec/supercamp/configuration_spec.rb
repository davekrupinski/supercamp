require 'spec_helper'

describe Supercamp::Configuration do
  describe '#configure' do
    context 'w/ valid settings' do
      before do
        subject.configure do |config|
          config.api_key  = 'super'
          config.timeout  = 10
        end
      end

      it { expect(subject.api_key).to eq 'super' }
      it { expect(subject.timeout).to eq 10 }
    end

    context 'w/ invalid settings' do
      it do
        expect {
          subject.configure do |config|
            config.crabs    = 'super'
          end
        }.to raise_error NoMethodError
      end
    end
  end

  describe '#base_url' do
    it { expect(subject.base_url).to eq 'http://api.amp.active.com/camping' }
  end

  describe '#api_key' do
    it 'defaults to nil' do
      expect(subject.api_key).to be_nil
    end
  end

  describe '#timeout' do
    it 'defaults to 5 (seconds)' do
      expect(subject.timeout).to eq 5
    end
  end
end
