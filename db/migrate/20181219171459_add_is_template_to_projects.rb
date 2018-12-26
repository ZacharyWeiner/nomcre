class AddIsTemplateToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :is_template, :boolean
  end
end
