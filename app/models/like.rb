class Like < ApplicationRecord
    validates_presence_of :user_id
    validates_presence_of :likeable_id
    validates_presence_of :community_id
    validates_presence_of :likeable_type
    belongs_to :user
    belongs_to :community
    belongs_to :likeable, polymorphic: true
end
