class AddPostIdToComment < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :post_id, :integer
    add_index :comments, :post_id
  end
end
