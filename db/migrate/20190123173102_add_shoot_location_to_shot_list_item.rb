class AddShootLocationToShotListItem < ActiveRecord::Migration[5.1]
  def change
    add_column :shot_list_items, :shoot_location, :string
  end
end
