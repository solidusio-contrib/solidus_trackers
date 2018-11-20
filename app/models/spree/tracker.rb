class Spree::Tracker < ActiveRecord::Base
  belongs_to :store

  validates :tracker_type, presence: true

  def self.current(store = nil)
    return if !store
    if store.is_a?(Spree::Store)
      Spree::Tracker.where(active: true, store_id: store)
    else
      # TODO: Remove in 2.0
      ActiveSupport::Deprecation.warn <<-EOS.squish, caller
        Calling Spree::Tracker.current with a string is DEPRECATED. Instead
        pass it an instance of Spree::Store.
      EOS
      Spree::Tracker.where(active: true).joins(:store).where(
        "spree_stores.code = ? OR spree_stores.url LIKE ?",
        store, "%#{store}%"
      )
    end
  end

  def self.by_type(store = nil, type = nil)
    return if !store
    if store.is_a?(Spree::Store)
      Spree::Tracker.where(active: true, store_id: store, tracker_type: type).first
    else
      # TODO: Remove in 2.0
      ActiveSupport::Deprecation.warn <<-EOS.squish, caller
        Calling Spree::Tracker.by_type with a string is DEPRECATED. Instead
        pass it an instance of Spree::Store.
      EOS
      Spree::Tracker.where(active: true, tracker_type: type).joins(:store).where(
        "spree_stores.code = ? OR spree_stores.url LIKE ?",
        store, "%#{store}%"
      ).first
    end
  end
end
