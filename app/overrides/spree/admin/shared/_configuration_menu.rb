Deface::Override.new(
  virtual_path: "spree/admin/shared/_configuration_menu",
  name: "tracker_admin_configurations_menu",
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu']",
  disabled: false,
  partial: "spree/shared/tracker_sidebar_entry",
  original: '1e1faff0102efd8aeec3d5f6370451d2078d01f3'
)
