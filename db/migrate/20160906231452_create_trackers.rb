class CreateTrackers < SolidusSupport::Migration[4.2][5.0]
  def up
    unless data_source_exists?("spree_trackers")
      create_table :spree_trackers do |t|
        t.string :environment
        t.string :analytics_id
        t.boolean :active, default: true

        t.timestamps
      end
    end
  end
end
