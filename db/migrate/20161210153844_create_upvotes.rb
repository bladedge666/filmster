class CreateUpvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :upvotes do |t|
      t.integer :count
      t.integer :review_id

      t.timestamps
    end
    add_index :upvotes, :review_id
  end
end
