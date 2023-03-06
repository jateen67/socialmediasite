class MakeCommentAttributesNonNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :comments, :body, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :post_id, false
    change_column_null :comments, :community_id, false
    change_column_null :comments, :parent_id, false
  end
end
