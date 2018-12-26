class AddIsDefaultTemplateToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :is_default_template, :boolean
  end
end
