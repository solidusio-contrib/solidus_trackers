require 'spec_helper'

describe 'Analytics Tracker', type: :feature do
  stub_authorization!
  let!(:store) { create(:store, name: 'test', default: true) }

  context 'index' do
    before(:each) do
      2.times { create(:tracker, store: store) }
      visit spree.admin_trackers_path
    end

    it 'should have the right content' do
      expect(page).to have_content('Analytics Trackers')
    end

    it 'should have the right tabular values displayed' do
      within_row(1) do
        expect(column_text(1)).to eq('A100')
        expect(column_text(3)).to eq('Yes')
      end

      within_row(2) do
        expect(column_text(1)).to eq('A100')
        expect(column_text(3)).to eq('Yes')
      end
    end
  end

  context 'create' do
    before(:each) do
      visit spree.admin_trackers_path
    end

    it 'should be able to create a new analytics tracker' do
      click_link 'admin_new_tracker_link'
      fill_in 'tracker_analytics_id', with: 'A100'
      select 'analytics', from: 'tracker_type'
      select 'test', from: 'store_id'
      click_button 'Create'

      expect(page).to have_content('successfully created!')

      within_row(1) do
        expect(column_text(1)).to eq('A100')
        expect(column_text(3)).to eq('Yes')
      end
    end

    it 'should be able to create a new manager tracker' do
      click_link 'admin_new_tracker_link'
      fill_in 'tracker_analytics_id', with: 'M100'
      select 'manager', from: 'tracker_type'
      select 'test', from: 'store_id'
      click_button 'Create'

      expect(page).to have_content('successfully created!')

      within_row(1) do
        expect(column_text(1)).to eq('M100')
        expect(column_text(3)).to eq('Yes')
      end
    end
  end

  context 'store' do
    it 'should display the script tag if a tracking id is provided for analytics' do
      create(:tracker, store: store)

      visit spree.root_path

      expect(page).to have_css('#solidus_trackers_analytics', visible: false)
    end

    it 'should display the script tag if a tracking id is provided for manager' do
      create(:tracker, store: store, tracker_type: 'manager')

      visit spree.root_path

      expect(page).to have_css('#solidus_trackers_manager', visible: false)
    end
  end
end
