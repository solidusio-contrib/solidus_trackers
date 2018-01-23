class AddStoreToTracker < SolidusSupport::Migration[4.2][5.0][5.1]
  def self.up
    if data_source_exists?('spree_trackers')
      change_table :spree_trackers do |t|
        t.references :store
      end
    end
  end

  def self.down
    if data_source_exists?('spree_trackers')
      change_table :spree_trackers do |t|
        t.remove :store_id
      end
    end
  end
end
