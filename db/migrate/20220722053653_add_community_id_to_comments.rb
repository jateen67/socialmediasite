class AddCommunityIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :community_id, :integer
  end
end
