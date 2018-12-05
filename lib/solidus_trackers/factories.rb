FactoryBot.define do
  factory :tracker, class: Spree::Tracker do
    name 'Google Analytics'
    analytics_id 'A100'
    active true
    script '<script></script>'
  end
end
