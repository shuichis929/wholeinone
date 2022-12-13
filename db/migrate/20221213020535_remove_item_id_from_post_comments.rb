class RemoveItemIdFromPostComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :post_comments, :item_id, :integer
  end
end
