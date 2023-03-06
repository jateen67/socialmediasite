class PolymorphicLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :post_id, :likeable_id
    add_column :likes, :likeable_type, :string
    remove_index :likes, [:user_id, :likeable_id, :community_id]
    add_index :likes, [:user_id, :community_id, :likeable_id, :likeable_type], unique: true, name: 'my_index'
  end
end
