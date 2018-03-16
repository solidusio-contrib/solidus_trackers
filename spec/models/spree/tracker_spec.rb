require 'spec_helper'

describe Spree::Tracker, type: :model do
  let(:store) { create(:store) }
  let!(:tracker) { create(:tracker, store: store) }
  let(:other_store) { create(:store, code: 'STORE2', url: 'realfakedoors.com') }
  let!(:other_tracker) { create(:tracker, store: other_store) }

  describe 'current' do
    it 'returns nil if no store passed in argument' do
      allow(Spree::Store).to receive(:default).and_return(nil)
      expect(Spree::Tracker.current).to eq([])
    end

    it 'returns the first active tracker' do
      expect(Spree::Tracker.current(store: store)).to eq([tracker])
    end

    it 'does not return an inactive tracker' do
      tracker.update_attribute(:active, false)
      expect(Spree::Tracker.current(store: store)).to eq([])
    end

    it 'finds tracker by store' do
      expect(Spree::Tracker.current(store: store)).to eq([tracker])
    end
  end

  describe 'validations' do
    before :each do
      @tracker = Spree::Tracker.new
    end

    it 'tracker is valid' do
      expect(@tracker).to_not be_valid
    end

    it 'tracker is valid' do
      @tracker.analytics_id = 'UA-12345'
      @tracker.store_id = store.id
      @tracker.tracker_type = 'analytics'

      expect(@tracker).to be_valid
    end

    it 'validates analytics_id' do
      @tracker.store_id = store.id
      @tracker.tracker_type = 'analytics'
      expect(@tracker).not_to be_valid
    end

    it 'validates store_id' do
      @tracker.analytics_id = 'UA-12345'
      @tracker.tracker_type = 'analytics'

      expect(@tracker).not_to be_valid
    end

    it 'validates tracker type' do
      @tracker.analytics_id = 'UA-12345'
      @tracker.store_id = store.id

      expect(@tracker).not_to be_valid
    end
  end
end
