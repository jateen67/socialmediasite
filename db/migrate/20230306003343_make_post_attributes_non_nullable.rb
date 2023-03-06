class MakePostAttributesNonNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :posts, :title, false, ""
    change_column_null :posts, :body, false, ""
    change_column_null :posts, :user_id, false
    change_column_null :posts, :community_id, false
  end
end
