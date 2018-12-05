class AddNewFieldsToSpreeTrackers < SolidusSupport::Migration[4.2][5.0]
  def change
    add_column :spree_trackers, :name, :string
    add_column :spree_trackers, :script, :text
  end
end
