# frozen_string_literal: true

module Biovision
  module Components
    # OAuth component
    class OauthComponent < BaseComponent
      def self.dependent_models
        [ForeignSite, ForeignUser]
      end
    end
  end
end
