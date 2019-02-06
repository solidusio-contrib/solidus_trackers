module SolidusTrackers
  class Configuration < Spree::Preferences::Configuration
    preference :types, :string, default: ['Google Analytics', 'Google Manager']
  end
end
