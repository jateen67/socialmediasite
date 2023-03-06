class AddUserIdToCommunities < ActiveRecord::Migration[7.0]
  def change
    add_column :communities, :user_id, :integer
  end
end
