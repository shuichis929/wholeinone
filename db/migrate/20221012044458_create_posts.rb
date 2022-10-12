class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :image,      null: false
      t.string :text,     null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
