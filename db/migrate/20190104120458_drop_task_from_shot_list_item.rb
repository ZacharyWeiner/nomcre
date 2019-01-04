class DropTaskFromShotListItem < ActiveRecord::Migration[5.1]
  def change
    change_table :shot_list_items do |t|
      t.remove :task_id
    end
  end
end
