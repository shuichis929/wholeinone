class AddPostIdToPostComments < ActiveRecord::Migration[6.0]
  def change
    add_column :post_comments, :post_id, :integer
  end
end
