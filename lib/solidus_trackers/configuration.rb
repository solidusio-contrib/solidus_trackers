module SolidusTrackers
  class Configuration < Spree::Preferences::Configuration
    preference :types, :string, default: 'analytics manager'
  end
end
