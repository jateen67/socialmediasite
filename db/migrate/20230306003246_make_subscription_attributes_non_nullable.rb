class MakeSubscriptionAttributesNonNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :subscriptions, :user_id, false
    change_column_null :subscriptions, :community_id, false
  end
end
