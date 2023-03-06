class MakeLikeAttributesNonNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :likes, :user_id, false
    change_column_null :likes, :likeable_id, false
    change_column_null :likes, :community_id, false
    change_column_null :likes, :likeable_type, false
  end
end
