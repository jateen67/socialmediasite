class Comment < ApplicationRecord
    validates_presence_of :body
    validates_presence_of :user_id
    validates_presence_of :post_id
    validates_presence_of :community_id
    belongs_to :user
    belongs_to :post
    belongs_to :community
    belongs_to :parent, class_name: 'Comment', optional: true  # specifying class of parent, can be nullable since its the top comment so it has no parent
    has_many :comments, foreign_key: :parent_id, dependent: :destroy # specify foreign key to derive list of replies for the comment
    has_many :likes, as: :likeable, dependent: :destroy
end
