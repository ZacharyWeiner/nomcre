class AddIsTemplateToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :is_template, :boolean
  end
end
