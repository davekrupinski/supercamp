require 'spec_helper'

describe Supercamp::Error do
  describe '.new' do
    context '403 - Forbidden' do
      before do
        expect(Supercamp.config).to receive(:api_key).and_return nil
      end

      around(:each) do |example|
        VCR.use_cassette 'error 403 forbidden' do
          example.run
        end
      end

      let :criteria do
        Supercamp.campsites.site_type('rv')
      end

      subject do
        Supercamp::Error.new criteria, criteria.query.run
      end

      it 'is a Supercamp::Error' do
        expect(subject).to be_instance_of Supercamp::Error
      end

      it 'sets :code' do
        expect(subject.code).to eq 403
      end

      it 'sets :api_code' do
        expect(subject.api_code).to eq 'ERR_403_DEVELOPER_INACTIVE'
      end

      it 'sets :message' do
        expect(subject.message).to eq '<h1>Developer Inactive</h1>'
      end
    end
  end
end
