class AddAddedByToShotListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :shot_list_items, :added_by_id, :bigint
  end
end
