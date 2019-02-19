class AddIsTemplateToTaskGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :task_groups, :is_template, :boolean
  end
end
