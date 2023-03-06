class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :community_id

      t.timestamps
    end

    add_index(:subscriptions, [:user_id, :community_id], unique: true) # user can only like community once
  end
end
