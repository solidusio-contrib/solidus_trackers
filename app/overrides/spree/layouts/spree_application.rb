Deface::Override.new(
  virtual_path: "spree/layouts/spree_application",
  name: "google_analytics_partial",
  insert_bottom: "[data-hook='body']",
  disabled: false,
  partial: "spree/shared/google_analytics"
)

Deface::Override.new(
  virtual_path: "spree/layouts/spree_application",
  name: "google_manager_partial",
  insert_bottom: "[data-hook='body']",
  disabled: false,
  partial: "spree/shared/google_manager"
)
