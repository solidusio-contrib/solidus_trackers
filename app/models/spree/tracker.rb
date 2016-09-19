class Spree::Tracker < ActiveRecord::Base
  def self.current
    tracker = where(active: true).first
    if tracker && tracker.analytics_id.present?
      tracker
    end
  end
end
