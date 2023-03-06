class Subscription < ApplicationRecord
    validates_presence_of :user_id
    validates_presence_of :community_id
    belongs_to :user
    belongs_to :community
end
