class AddUserToUpvotes < ActiveRecord::Migration[5.0]
  def change
    add_column :upvotes, :user_id, :integer
    add_index :upvotes, :user_id
  end
end
