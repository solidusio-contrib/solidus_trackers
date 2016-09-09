module Spree
  module PermissionSets
    class TrackerManagement < PermissionSets::Base
      def activate!
        can :manage, Spree::Tracker
      end
    end
  end
end
