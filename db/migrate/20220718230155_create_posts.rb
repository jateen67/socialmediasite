class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.integer :number_of_comments, default: 0

      t.timestamps
    end
  end
end
