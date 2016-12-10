class RemoveCountFromUpvotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :upvotes, :count
  end
end
