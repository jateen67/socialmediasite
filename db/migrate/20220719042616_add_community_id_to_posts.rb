class AddCommunityIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :community_id, :integer
  end
end
