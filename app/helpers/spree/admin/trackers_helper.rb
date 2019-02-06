module Spree
  module Admin
    module TrackersHelper
      def tracker_types
        SolidusTrackers::Config[:types].map do |type|
          [type, type.downcase.tr(' ', '_')]
        end
      end

      def display_tracker_type(tracker)
        tracker.tracker_type.split('_').map(&:capitalize).join(' ')
      end
    end
  end
end
