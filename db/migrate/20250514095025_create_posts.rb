class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :content
      t.datetime :date

      t.timestamps
    end
  end
end
