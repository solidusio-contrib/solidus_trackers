class AddTrackerTypeToSpreeTrackers < SolidusSupport::Migration[4.2][5.0]
  def up
    add_column :spree_trackers, :tracker_type, :string
  end

  def down
    remove_column :spree_trackers, :tracker_type
  end
end
