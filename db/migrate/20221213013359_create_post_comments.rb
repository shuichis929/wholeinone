class CreatePostComments < ActiveRecord::Migration[6.0]
  def change
    create_table :post_comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
