class Post < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :body
    validates_presence_of :user_id
    validates_presence_of :community_id
    belongs_to :user
    belongs_to :community
    has_many :comments, :dependent => :destroy
    has_many :likes, as: :likeable, :dependent => :destroy
end
