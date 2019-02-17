class AddTaskGroupToShotListItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :shot_list_items, :task_group, foreign_key: true
  end
end
