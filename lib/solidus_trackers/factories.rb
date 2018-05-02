FactoryBot.define do
  factory :tracker, class: Spree::Tracker do
    analytics_id { 'A100' }
    active { true }
    tracker_type { 'google_analytics' }
  end
end
