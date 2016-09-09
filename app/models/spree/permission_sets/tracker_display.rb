module Spree
  module PermissionSets
    class TrackerDisplay < PermissionSets::Base
      def activate!
        can [:display, :admin], Spree::Tracker
      end
    end
  end
end
