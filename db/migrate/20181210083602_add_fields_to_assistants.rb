class AddFieldsToAssistants < ActiveRecord::Migration[5.1]
  def change
    add_column :assistants, :facebook, :string
    add_column :assistants, :instagram, :string
    add_column :assistants, :notes, :text
  end
end
