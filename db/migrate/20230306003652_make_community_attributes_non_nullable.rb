class MakeCommunityAttributesNonNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :communities, :title, false
    change_column_null :communities, :user_id, false
    change_column_null :communities, :description, false
  end
end
