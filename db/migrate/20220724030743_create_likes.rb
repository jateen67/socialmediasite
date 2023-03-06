class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :community_id

      t.timestamps
    end

    add_index(:likes, [:user_id, :post_id, :community_id], unique: true) # user can only like a unique post 1 time
  end
end
