class AddExplanationToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :explanation, :string
  end
end
