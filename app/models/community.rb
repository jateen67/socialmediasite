class Community < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :user_id
    validates_presence_of :description
    belongs_to :user
    has_many :posts, dependent: :destroy
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :subscriptions, dependent: :destroy
end
