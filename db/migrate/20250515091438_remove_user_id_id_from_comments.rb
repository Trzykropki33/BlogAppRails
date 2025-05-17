class RemoveUserIdIdFromComments < ActiveRecord::Migration[8.0]
  def change
    remove_index :comments, :user_id_id
    remove_column :comments, :user_id_id, :integer
  end
end
