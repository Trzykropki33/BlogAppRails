class AddUserIdToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
  end
end
