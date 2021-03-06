# frozen_string_literal: true

# Foreign user
# 
# Attributes:
#   agent_id [Agent], optional
#   created_at [DateTime]
#   data [jsonb]
#   foreign_site_id [ForeignSite]
#   ip_address_id [IpAddress], optional
#   updated_at [DateTime]
#   user_id [User]
#   slug [string]
class ForeignUser < ApplicationRecord
  include HasOwner
  include HasTrack

  belongs_to :foreign_site
  belongs_to :user
end
