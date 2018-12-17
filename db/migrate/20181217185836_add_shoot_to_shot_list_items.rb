class AddShootToShotListItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :shot_list_items, :shoot, foreign_key: true
  end
end
