class RemoveEnvironmentToSpreeTrackers < SolidusSupport::Migration[4.2][5.0]
  def up
    remove_column :spree_trackers, :environment
  end

  def down
    add_column :spree_trackers, :environment, :string
  end
end
