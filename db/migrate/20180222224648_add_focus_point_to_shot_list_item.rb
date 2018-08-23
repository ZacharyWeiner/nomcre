class AddFocusPointToShotListItem < ActiveRecord::Migration[5.1]
  def change
    add_column :shot_list_items, :focus_point, :string
  end
end
