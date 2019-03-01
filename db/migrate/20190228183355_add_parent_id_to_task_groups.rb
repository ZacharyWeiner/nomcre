class AddParentIdToTaskGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :task_groups, :parent_id, :bigint
  end
end
