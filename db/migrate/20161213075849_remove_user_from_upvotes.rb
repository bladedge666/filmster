class RemoveUserFromUpvotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :upvotes, :user_id
  end
end
