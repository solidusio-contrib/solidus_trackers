class Spree::Tracker < ActiveRecord::Base
  belongs_to :store

  validates :analytics_id, :store_id, :tracker_type, presence: true

  def self.current(store: nil, type: 'analytics')
    return [] unless retrieve_store(store)

    Spree::Tracker.where(active: true,
                         store_id: retrieve_store(store),
                         tracker_type: type)
  end

  def self.retrieve_store(store = nil)
    store || Spree::Store.default
  end
end
