class AddTemplateToScene < ActiveRecord::Migration[5.1]
  def change
    add_column :scenes, :is_template, :boolean
  end
end
