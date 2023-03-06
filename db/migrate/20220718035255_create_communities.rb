class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.string :title
      t.text :rules
      t.integer :members

      t.timestamps
    end
  end
end
