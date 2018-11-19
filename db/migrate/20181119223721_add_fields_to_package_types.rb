class AddFieldsToPackageTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :package_types, :show_on_index, :boolean
    add_column :package_types, :call_to_action_text, :text
  end
end
