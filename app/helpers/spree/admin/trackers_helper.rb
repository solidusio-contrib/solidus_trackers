module Spree
  module Admin
    module TrackersHelper
      def tracker_types
        SolidusTrackers::Config[:types].split(' ')
      end
    end
  end
end